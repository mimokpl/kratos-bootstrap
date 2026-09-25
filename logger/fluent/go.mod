module github.com/mimokpl/kratos-bootstrap/logger/fluent

go 1.25.0

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../../api
	github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
)

require (
	github.com/fluent/fluent-logger-golang v1.10.1
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/mimokpl/kratos-bootstrap/logger v1.9.2
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	github.com/philhofer/fwd v1.2.0 // indirect
	github.com/tinylib/msgp v1.6.4 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
)
