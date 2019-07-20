#################################################
GOFILES	:= $(shell ls *.go |grep -v test)
GOOS := linux
GOARCH := amd64
GOBUILD	:= GOOS=$(GOOS) GOARCH=$(GOARCH) go build
#################################################
default:	deps test build
docker:		deps test linuxbuild docker

deps:
	go get

build:
	$(GOBUILD) $(GOFILES)

linuxbuild:
	GOOS=linux GOARCH=amd64 go build $(GOFILES)

docker:
	docker build -t maguec/twemproxy-exporter .

test:
	go test -v
