module github.com/mimokpl/kratos-bootstrap/registry/servicecomb

go 1.25.0

replace (
	github.com/armon/go-metrics => github.com/hashicorp/go-metrics v0.4.1

	github.com/mimokpl/kratos-bootstrap/api => ../../api
	github.com/mimokpl/kratos-bootstrap/registry => ../
)

require (
	github.com/go-chassis/cari v0.9.0
	github.com/go-chassis/sc-client v0.7.0
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/gofrs/uuid v4.4.0+incompatible
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/mimokpl/kratos-bootstrap/registry v1.9.2
	github.com/stretchr/testify v1.12.1
	google.golang.org/protobuf v1.36.12
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
	go.yaml.in/yaml/v3 v3.0.5 // indirect
)

require (
	github.com/cenkalti/backoff/v4 v4.3.0 // indirect
	github.com/deckarep/golang-set v1.8.0 // indirect
	github.com/go-chassis/foundation v0.4.0 // indirect
	github.com/go-chassis/openlog v1.1.3 // indirect
	github.com/gogo/protobuf v1.3.2 // indirect
	github.com/gorilla/websocket v1.5.3 // indirect
	github.com/karlseguin/ccache/v2 v2.0.8 // indirect
	github.com/mimokpl/go-utils v1.9.2 // indirect
	github.com/mimokpl/kratos-bootstrap/logger v1.9.2
	github.com/patrickmn/go-cache v2.1.0+incompatible // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
