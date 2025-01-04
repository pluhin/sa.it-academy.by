FROM alpine

RUN apk add nmap --no-cache && rm -f /var/cache/apk/*
ENTRYPOINT ["nmap"]
