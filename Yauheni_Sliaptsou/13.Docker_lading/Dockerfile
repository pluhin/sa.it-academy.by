FROM golang:1.14.0-alpine3.11

RUN mkdir /app
COPY . /app/

WORKDIR /app
RUN go build -o main .
EXPOSE 8090

CMD ["/app/main"]
