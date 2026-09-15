module github.com/mimokpl/kratos-bootstrap/registry

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/mimokpl/go-utils v1.1.1
	github.com/mimokpl/kratos-bootstrap/api v1.1.1
)

require google.golang.org/protobuf v1.36.12 // indirect
