module github.com/mimokpl/kratos-bootstrap/script_engine

go 1.24.6

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/mimokpl/go-scripts v0.0.8
	github.com/mimokpl/kratos-bootstrap/api v0.0.45
)

require google.golang.org/protobuf v1.36.12 // indirect
