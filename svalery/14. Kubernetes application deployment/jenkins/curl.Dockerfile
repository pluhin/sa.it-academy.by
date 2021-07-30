FROM alpine

RUN apk add curl bash --no-cache && rm -f /var/cache/apk/*
