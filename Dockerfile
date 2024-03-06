FROM golang:alpine AS builder
WORKDIR /usr/src/app
RUN go mod init example.com && go mod download 
COPY . .

RUN go get -d -v
RUN go build -o /go/bin/hello
FROM scratch
COPY --from=builder /go/bin/hello /go/bin/hello

CMD ["/go/bin/hello"]