module github.com/mimokpl/kratos-bootstrap/config

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.1
	google.golang.org/protobuf v1.36.12
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
)

require (
	github.com/fsnotify/fsnotify v1.10.1 // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/mimokpl/kratos-bootstrap/logger v1.9.1
	golang.org/x/sys v0.47.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
