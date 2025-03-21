# Stage 1: Build the Go application
FROM golang:1.24.1 AS builder

COPY ./main.go ./
COPY ./pkg ./tempo/pkg
COPY ./app ./tempo/app
COPY ./build ./tempo/build
RUN CGO_ENABLED=0 GOAMD64=v2 go build -mod vendor -o ./bin/linux/tempo-amd64 main.go

# Stage 2: Install CA certificates
FROM alpine:latest AS ca-certificates
RUN apk add --update --no-cache ca-certificates

# Stage 3: Final image
FROM gcr.io/distroless/static-debian12:debug

# Copy the binary from the builder stage
COPY --from=builder /go/bin/linux/tempo-amd64 /tempo

# Copy CA certificates from the ca-certificates stage
COPY --from=ca-certificates /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

# Set up user and permissions
SHELL ["/busybox/sh", "-c"]
RUN ["/busybox/addgroup", "-g", "10001", "-S", "tempo"]
RUN ["/busybox/adduser", "-u", "10001", "-S", "tempo", "-G", "tempo"]
RUN ["/busybox/mkdir", "-p", "/var/tempo", "-m", "0700"]
RUN ["/busybox/chown", "-R", "tempo:tempo", "/var/tempo"]

USER 10001:10001

ENTRYPOINT ["/tempo"]