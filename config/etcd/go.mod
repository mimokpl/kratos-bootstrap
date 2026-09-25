module github.com/mimokpl/kratos-bootstrap/config/etcd

go 1.26

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../../api
	github.com/mimokpl/kratos-bootstrap/config => ../
)

require (
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/mimokpl/go-utils v1.9.2
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/mimokpl/kratos-bootstrap/config v1.9.2
	go.etcd.io/etcd/client/v3 v3.7.1
	google.golang.org/grpc v1.83.2
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
)

require (
	github.com/coreos/go-semver v0.3.1 // indirect
	github.com/coreos/go-systemd/v22 v22.7.0 // indirect
	github.com/fsnotify/fsnotify v1.10.1 // indirect
	github.com/golang/protobuf v1.5.4 // indirect
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.30.0 // indirect
	github.com/mimokpl/kratos-bootstrap/logger v1.9.2
	go.etcd.io/etcd/api/v3 v3.7.1 // indirect
	go.etcd.io/etcd/client/pkg/v3 v3.7.1 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	go.uber.org/zap v1.28.0 // indirect
	golang.org/x/net v0.58.0 // indirect
	golang.org/x/sys v0.47.0 // indirect
	golang.org/x/text v0.41.0 // indirect
	google.golang.org/genproto/googleapis/api v0.0.0-20260825221802-da73d73af1c5 // indirect
	google.golang.org/genproto/googleapis/rpc v0.0.0-20260825221802-da73d73af1c5 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
