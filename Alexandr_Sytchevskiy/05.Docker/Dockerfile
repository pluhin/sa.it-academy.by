FROM alpine:latest

MAINTAINER Alexandr Sytchevskiy

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip \
    && mkdir /myapp

COPY app.py /myapp/app.py

CMD ["python3", "/myapp/app.py"]

EXPOSE 8080
