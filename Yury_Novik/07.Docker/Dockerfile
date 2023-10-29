FROM alpine:latest AS base

LABEL maintainer="yurunovik3@gmail.com"

RUN apk update \
    && apk add --no-cache wget \
    && mkdir /test
WORKDIR /test
RUN wget -O test_speed.zip http://speedtest.wdc01.softlayer.com/downloads/test10.zip

FROM kramos/alpine-zip:latest AS zip

COPY --from=base /test/test_speed.zip /tmp
