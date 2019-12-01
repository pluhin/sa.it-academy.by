FROM alpine:latest

RUN apk add --no-cache python3

EXPOSE 5626

COPY test-srv.py /tmp/test-srv.py

CMD ["python3", "/tmp/test-srv.py"]
