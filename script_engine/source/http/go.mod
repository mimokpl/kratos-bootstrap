module github.com/mimokpl/kratos-bootstrap/script_engine/source/http

go 1.24.6

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../../../api
	github.com/mimokpl/kratos-bootstrap/script_engine => ../../
)

require (
	github.com/mimokpl/go-scripts v1.1.1
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/mimokpl/kratos-bootstrap/script_engine v1.9.2
)

require (
	github.com/mimokpl/kratos-bootstrap/logger v1.9.2
	google.golang.org/protobuf v1.36.12 // indirect
)

// TODO: 当 go-scripts/source/http 发布后，添加以下依赖:
// require github.com/mimokpl/go-scripts/source/http v1.1.1

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
