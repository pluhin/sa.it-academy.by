FROM python:alpine

LABEL maintainer="zhiv-art@yandex.com"

RUN apk update && apk upgrade && apk add bash && apk add --update --no-cache python3
RUN ln -sf python3 /usr/bin/python && python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools

COPY ./login-form-app-sample /app
WORKDIR /app

RUN pip install -r requirements.txt
 
CMD python3 -m flask run --host 0.0.0.0