FROM golang:1.14

LABEL maintainer="apachy999@gmail.com"

WORKDIR /go/src/app
COPY . .

RUN go get -d -v ./...
RUN go install -v ./...

CMD ["app"]