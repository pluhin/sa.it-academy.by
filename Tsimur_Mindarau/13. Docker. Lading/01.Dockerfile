FROM golang:1.14.0-alpine3.11

RUN mkdir /app
WORKDIR /app

COPY . /app/

EXPOSE 8888

CMD go run app/listner.go
