module github.com/mimokpl/kratos-bootstrap/logger

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/mimokpl/kratos-bootstrap/api v1.1.1
	go.opentelemetry.io/otel/trace v1.46.0
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	golang.org/x/sync v0.20.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
)
