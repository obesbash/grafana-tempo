FROM golang:1.24.1 AS builder

COPY ./main.go ./
COPY go.mod ./

RUN go mod download
RUN CGO_ENABLED=0 GOAMD64=v2 go build -mod=mod -o ./bin/linux/tempo-amd64 main.go

FROM alpine:latest AS ca-certificates
RUN apk add --update --no-cache ca-certificates

FROM gcr.io/distroless/static-debian12:debug

COPY --from=builder /go/bin/linux/tempo-amd64 /tempo
COPY --from=ca-certificates /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

SHELL ["/busybox/sh", "-c"]
RUN ["/busybox/addgroup", "-g", "10001", "-S", "tempo"]
RUN ["/busybox/adduser", "-u", "10001", "-S", "tempo", "-G", "tempo"]
RUN ["/busybox/mkdir", "-p", "/var/tempo", "-m", "0700"]
RUN ["/busybox/chown", "-R", "tempo:tempo", "/var/tempo"]

USER 10001:10001

ENTRYPOINT ["/tempo"]