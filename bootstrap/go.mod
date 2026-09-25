module github.com/mimokpl/kratos-bootstrap/bootstrap

go 1.25.3

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../api
	github.com/mimokpl/kratos-bootstrap/config => ../config
	github.com/mimokpl/kratos-bootstrap/logger => ../logger
	github.com/mimokpl/kratos-bootstrap/registry => ../registry
	github.com/mimokpl/kratos-bootstrap/tracer => ../tracer
)

require (
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/google/subcommands v1.2.0
	github.com/mimokpl/go-utils v1.9.0
	github.com/mimokpl/go-utils/id v1.9.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.0
	github.com/mimokpl/kratos-bootstrap/config v1.9.0
	github.com/mimokpl/kratos-bootstrap/logger v1.9.0
	github.com/mimokpl/kratos-bootstrap/registry v1.9.0
	github.com/mimokpl/kratos-bootstrap/tracer v1.9.0
	github.com/olekukonko/tablewriter v1.1.4
	github.com/spf13/cobra v1.10.2
	github.com/stretchr/testify v1.12.1
	golang.org/x/tools v0.49.0
	google.golang.org/protobuf v1.36.12
)

require (
	github.com/bwmarrin/snowflake v0.3.0 // indirect
	github.com/cenkalti/backoff/v5 v5.0.3 // indirect
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/clipperhouse/displaywidth v0.11.0 // indirect
	github.com/clipperhouse/uax29/v2 v2.7.0 // indirect
	github.com/fatih/color v1.19.0 // indirect
	github.com/fsnotify/fsnotify v1.10.1 // indirect
	github.com/go-kratos/kratos/v2 v2.9.2 // indirect
	github.com/go-logr/logr v1.4.4 // indirect
	github.com/go-logr/stdr v1.2.2 // indirect
	github.com/go-playground/form/v4 v4.3.0 // indirect
	github.com/goccy/go-json v0.10.6 // indirect
	github.com/google/uuid v1.6.0 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.30.0 // indirect
	github.com/inconshreveable/mousetrap v1.1.0 // indirect
	github.com/lithammer/shortuuid/v4 v4.3.0 // indirect
	github.com/mattn/go-colorable v0.1.15 // indirect
	github.com/mattn/go-isatty v0.0.24 // indirect
	github.com/mattn/go-runewidth v0.0.28 // indirect
	github.com/olekukonko/cat v0.0.0-20250911104152-50322a0618f6 // indirect
	github.com/olekukonko/errors v1.3.0 // indirect
	github.com/olekukonko/ll v0.1.8 // indirect
	github.com/openzipkin/zipkin-go v0.4.3 // indirect
	github.com/rs/xid v1.6.0 // indirect
	github.com/segmentio/ksuid v1.0.4 // indirect
	github.com/sony/sonyflake v1.3.0 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	go.mongodb.org/mongo-driver/v2 v2.8.2 // indirect
	go.opentelemetry.io/auto/sdk v1.2.1 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace v1.46.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracegrpc v1.46.0 // indirect
	go.opentelemetry.io/otel/exporters/otlp/otlptrace/otlptracehttp v1.46.0 // indirect
	go.opentelemetry.io/otel/exporters/stdout/stdouttrace v1.46.0 // indirect
	go.opentelemetry.io/otel/exporters/zipkin v1.46.0 // indirect
	go.opentelemetry.io/otel/metric v1.46.0 // indirect
	go.opentelemetry.io/otel/sdk v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
	go.opentelemetry.io/proto/otlp v1.11.0 // indirect
	go.yaml.in/yaml/v3 v3.0.5 // indirect
	golang.org/x/mod v0.40.0 // indirect
	golang.org/x/net v0.58.0 // indirect
	golang.org/x/sync v0.22.0 // indirect
	golang.org/x/sys v0.47.0 // indirect
	golang.org/x/text v0.41.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20260825221802-da73d73af1c5 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20260825221802-da73d73af1c5 // indirect
	google.golang.org/grpc v1.83.2 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
