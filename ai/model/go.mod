module github.com/mimokpl/kratos-bootstrap/ai/model

go 1.24.6

replace github.com/mimokpl/kratos-bootstrap/api => ../../api

require (
	github.com/mimokpl/kratos-bootstrap/api v1.9.1
	github.com/sashabaranov/go-openai v1.42.0
)

require (
	github.com/mimokpl/kratos-bootstrap/logger v1.9.1
	google.golang.org/protobuf v1.36.12 // indirect
)

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
