module github.com/mimokpl/kratos-bootstrap/config/apollo

go 1.25.0

replace (
	github.com/mimokpl/kratos-bootstrap/api => ../../api
	github.com/mimokpl/kratos-bootstrap/config => ../
)

require (
	github.com/apolloconfig/agollo/v4 v4.4.0
	github.com/go-kratos/kratos/v3 v3.0.0
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/mimokpl/kratos-bootstrap/config v1.9.2
)

require (
	github.com/cespare/xxhash/v2 v2.3.0 // indirect
	go.opentelemetry.io/otel v1.46.0 // indirect
	go.opentelemetry.io/otel/trace v1.46.0 // indirect
)

require (
	github.com/fsnotify/fsnotify v1.10.1 // indirect
	github.com/go-viper/mapstructure/v2 v2.5.0 // indirect
	github.com/mimokpl/kratos-bootstrap/logger v1.9.2
	github.com/pelletier/go-toml/v2 v2.4.3 // indirect
	github.com/sagikazarmark/locafero v0.12.0 // indirect
	github.com/spf13/afero v1.15.0 // indirect
	github.com/spf13/cast v1.10.0 // indirect
	github.com/spf13/pflag v1.0.10 // indirect
	github.com/spf13/viper v1.21.0 // indirect
	github.com/subosito/gotenv v1.6.0 // indirect
	go.yaml.in/yaml/v3 v3.0.5 // indirect
	golang.org/x/sys v0.47.0 // indirect
	golang.org/x/text v0.41.0 // indirect
	google.golang.org/protobuf v1.36.12 // indirect
	gopkg.in/yaml.v3 v3.0.1 // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
