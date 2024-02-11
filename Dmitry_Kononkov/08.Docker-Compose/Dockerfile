FROM golang:1.12.0-alpine3.9 AS BuildStage
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN go build -o main .
EXPOSE 3000

FROM alpine:latest
WORKDIR /
COPY --from=BuildStage /app /app
EXPOSE 3000
CMD ["/app/main"]