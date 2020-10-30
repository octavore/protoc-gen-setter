default:
	go build ./cmd/protoc-gen-setter

proto:
	PATH=$$PWD/local/bin:$$PATH protoc setterpb/setter.proto --go_out=. --go_opt=paths=source_relative

prepare:
	GOBIN=$$PWD/local/bin go install google.golang.org/protobuf/cmd/protoc-gen-go