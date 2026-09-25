module github.com/mimokpl/kratos-bootstrap/registry/zookeeper

go 1.25.0

replace (
	github.com/armon/go-metrics => github.com/hashicorp/go-metrics v0.4.1

	github.com/mimokpl/kratos-bootstrap/api => ../../api
	github.com/mimokpl/kratos-bootstrap/registry => ../
)

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/go-zookeeper/zk v1.0.4
	github.com/mimokpl/kratos-bootstrap/api v1.9.1
	github.com/mimokpl/kratos-bootstrap/registry v1.9.1
	github.com/stretchr/testify v1.11.1
	golang.org/x/sync v0.22.0
	google.golang.org/protobuf v1.36.12
)

require (
	github.com/davecgh/go-spew v1.1.2-0.20180830191138-d8f796af33cc // indirect
	github.com/kr/text v0.2.0 // indirect
	github.com/mimokpl/go-utils v1.9.1 // indirect
	github.com/mimokpl/kratos-bootstrap/logger v1.9.1
	github.com/pmezard/go-difflib v1.0.1-0.20181226105442-5d4384ee4fb2 // indirect
	github.com/rogpeppe/go-internal v1.13.1 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
