FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python py-pip bash

COPY http_server.py /tmp/http_server.py
COPY index.html /tmp/index.html

WORKDIR /tmp

CMD ["python", "/tmp/http_server.py"]

EXPOSE 8000
