module github.com/mimokpl/kratos-bootstrap/registry

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/mimokpl/go-utils v1.9.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.0
)

require google.golang.org/protobuf v1.36.12 // indirect
