FROM alpine:latest

MAINTAINER Yuri_Vygovskiy

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip \
    && mkdir /www

COPY test_api.py /www/test_api.py

CMD ["python3", "/www/test_api.py"]

EXPOSE 8080

