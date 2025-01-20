.PHONY: build

build:
	sam build

build-HelloWorldFunction:
	GOARCH=amd64 GOOS=linux go build -tags lambda.norpc -o bootstrap ./cmd/function1/main.go
	cp ./bootstrap $(ARTIFACTS_DIR)
build-ByeWorldFunction:
	GOARCH=amd64 GOOS=linux go build -tags lambda.norpc -o bootstrap ./cmd/function2/main.go
	cp ./bootstrap $(ARTIFACTS_DIR)