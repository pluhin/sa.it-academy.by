
FROM alpine:latest

RUN apk add python3 --no-cache && rm -f /var/cache/apk/*

COPY ./server1.py /

CMD ["python3", "./server1.py"]

EXPOSE 5150
