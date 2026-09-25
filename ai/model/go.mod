module github.com/mimokpl/kratos-bootstrap/ai/model

go 1.25.0

replace github.com/mimokpl/kratos-bootstrap/api => ../../api

require (
	github.com/mimokpl/kratos-bootstrap/api v1.9.2
	github.com/sashabaranov/go-openai v1.42.0
)

require google.golang.org/protobuf v1.36.12 // indirect

replace github.com/mimokpl/kratos-bootstrap/logger => /Users/sec/codes/mimokpl/mimox/relys/kratos-bootstrap/logger
