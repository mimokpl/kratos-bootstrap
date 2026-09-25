module github.com/mimokpl/kratos-bootstrap/database/cassandra

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../../api

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/gocql/gocql v1.7.0
	github.com/mimokpl/go-utils v1.9.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.0
)

require (
	github.com/golang/snappy v1.0.0 // indirect
	github.com/hailocab/go-hostpool v0.0.0-20160125115350-e80d13ce29ed // indirect
	github.com/kr/text v0.2.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
	gopkg.in/inf.v0 v0.9.1 // indirect
)
