FROM alpine:latest

RUN apk add python3 --no-cache && rm -f /var/cache/apk/*

COPY ./echo_server.py /

CMD ["python3", "./echo_server.py"]

EXPOSE 5005
