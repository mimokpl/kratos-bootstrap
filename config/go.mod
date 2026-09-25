module github.com/mimokpl/kratos-bootstrap/config

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../api

require (
	github.com/go-kratos/kratos/v2 v2.9.2
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.0
	google.golang.org/protobuf v1.36.12
)

require (
	github.com/fsnotify/fsnotify v1.10.1 // indirect
	github.com/kr/text v0.2.0 // indirect
	golang.org/x/sys v0.47.0 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)
