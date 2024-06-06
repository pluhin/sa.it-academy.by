FROM alpine:latest AS base

LABEL maintainer="pluhin@gmail.com"

RUN apk update \
    && apk add --no-cache wget \
    && mkdir /test
WORKDIR /test
RUN wget -O test_speed.zip http://ipv4.download.thinkbroadband.com/10MB.zip

FROM kramos/alpine-zip:latest AS zip

COPY --from=base /test/test_speed.zip /tmp
