package rpc

import (
	"crypto/tls"
	"net/http/pprof"

	"github.com/gorilla/handlers"


	kratosRest "github.com/go-kratos/kratos/v3/transport/http"

	"github.com/go-kratos/kratos/v3/middleware"
	"github.com/go-kratos/kratos/v3/middleware/metadata"
	"github.com/go-kratos/kratos/v3/middleware/recovery"
	"github.com/go-kratos/kratos/v3/middleware/selector"
	"github.com/go-kratos/kratos/contrib/otel/v3/tracing"

	conf "github.com/mimokpl/kratos-bootstrap/api/gen/go/conf/v1"
	"github.com/mimokpl/kratos-bootstrap/rpc/middleware/validate"
)

// CreateRestServer 创建REST服务端
func CreateRestServer(cfg *conf.Bootstrap, mds ...middleware.Middleware) (*kratosRest.Server, error) {
	options, err := initRestConfig(cfg, mds...)
	if err != nil {
		return nil, err
	}

	srv := kratosRest.NewServer(options...)

	if cfg != nil && cfg.Server != nil && cfg.Server.Rest != nil && cfg.Server.Rest.GetEnablePprof() {
		registerHttpPprof(srv)
	}

	return srv, nil
}

// initRestConfig 初始化REST服务配置
func initRestConfig(cfg *conf.Bootstrap, mds ...middleware.Middleware) ([]kratosRest.ServerOption, error) {
	if cfg == nil || cfg.Server == nil || cfg.Server.Rest == nil {
		return nil, nil
	}

	var options []kratosRest.ServerOption

	if cfg.Server.Rest.Cors != nil {
		corsOptions := []handlers.CORSOption{
			handlers.AllowedHeaders(cfg.Server.Rest.Cors.Headers),
			handlers.AllowedMethods(cfg.Server.Rest.Cors.Methods),
			handlers.AllowedOrigins(cfg.Server.Rest.Cors.Origins),
		}
		// 前端以 HttpOnly Cookie 传 refresh token 时（withCredentials=true），
		// 浏览器要求预检响应携带 Access-Control-Allow-Credentials: true
		if cfg.Server.Rest.Cors.GetAllowCredentials() {
			corsOptions = append(corsOptions, handlers.AllowCredentials())
		}
		options = append(options, kratosRest.Filter(handlers.CORS(corsOptions...)))
	}

	var ms []middleware.Middleware
	if cfg.Server.Rest.Middleware != nil {
		if cfg.Server.Rest.Middleware.GetEnableRecovery() {
			ms = append(ms, recovery.Recovery())
		}
		if cfg.Server.Rest.Middleware.GetEnableTracing() {
			ms = append(ms, tracing.Server())
		}
		if cfg.Server.Rest.Middleware.GetEnableValidate() {
			ms = append(ms, validate.ProtoValidate())
		}
		if cfg.Server.Rest.Middleware.GetEnableCircuitBreaker() {
		}
		// NOTE: v3 ratelimit.Limiter 与 aegis 不兼容，限流中间件暂未接入
		if cfg.Server.Rest.Middleware.GetEnableMetadata() {
			ms = append(ms, metadata.Server())
		}
	}
	ms = append(ms, mds...)

	options = append(options, kratosRest.Middleware(ms...))

	if cfg.Server.Rest.Network != "" {
		options = append(options, kratosRest.Network(cfg.Server.Rest.Network))
	}
	if cfg.Server.Rest.Addr != "" {
		options = append(options, kratosRest.Address(cfg.Server.Rest.Addr))
	}
	if cfg.Server.Rest.Timeout != nil {
		options = append(options, kratosRest.Timeout(cfg.Server.Rest.Timeout.AsDuration()))
	}

	if cfg.Server.Rest.Tls != nil {
		var tlsCfg *tls.Config
		var err error

		if tlsCfg, err = loadServerTlsConfig(cfg.Server.Rest.Tls); err != nil {
			return nil, err
		}

		if tlsCfg != nil {
			options = append(options, kratosRest.TLSConfig(tlsCfg))
		}
	}

	return options, nil
}

// registerHttpPprof 注册pprof路由
func registerHttpPprof(s *kratosRest.Server) {
	s.HandleFunc("/debug/pprof", pprof.Index)

	s.HandleFunc("/debug/cmdline", pprof.Cmdline)
	s.HandleFunc("/debug/profile", pprof.Profile)
	s.HandleFunc("/debug/symbol", pprof.Symbol)
	s.HandleFunc("/debug/trace", pprof.Trace)

	s.HandleFunc("/debug/allocs", pprof.Handler("allocs").ServeHTTP)
	s.HandleFunc("/debug/block", pprof.Handler("block").ServeHTTP)
	s.HandleFunc("/debug/goroutine", pprof.Handler("goroutine").ServeHTTP)
	s.HandleFunc("/debug/heap", pprof.Handler("heap").ServeHTTP)
	s.HandleFunc("/debug/mutex", pprof.Handler("mutex").ServeHTTP)
	s.HandleFunc("/debug/threadcreate", pprof.Handler("threadcreate").ServeHTTP)
}

// NewRestWhiteListMatcher 创建REST白名单匹配器
func NewRestWhiteListMatcher() selector.MatchFunc {
	// reuse package-level DefaultWhiteList matcher for REST
	return NewWhiteListMatcher()
}
