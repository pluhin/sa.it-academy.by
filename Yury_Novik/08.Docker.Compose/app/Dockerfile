# We need a golang build environment first
FROM golang:1.16.0-alpine3.13
 
WORKDIR /go/src/app
ADD hello-world.go /go/src/app
 
RUN go build hello-world.go
 
# We use a Docker multi-stage build here in order that we only take the compiled go executable
FROM alpine:3.13
 
COPY --from=0 "/go/src/app/hello-world" hello-world
 
ENTRYPOINT ./hello-world
