module github.com/mimokpl/kratos-bootstrap/script_engine/source/etcd

go 1.24.6

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../../../api
	github.com/mimokpl/kratos-bootstrap/script_engine => ../../
)

require (
	github.com/mimokpl/go-scripts v1.1.1
	github.com/mimokpl/kratos-bootstrap/api v1.1.1
	github.com/mimokpl/kratos-bootstrap/script_engine v1.1.1
)

require (
	github.com/go-kratos/kratos/v2 v2.9.2 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
)

// TODO: 当 go-scripts/source/etcd 发布后，添加以下依赖:
// require github.com/mimokpl/go-scripts/source/etcd v1.1.1
//	(以及 go.etcd.io/etcd/client/v3 等间接依赖)
