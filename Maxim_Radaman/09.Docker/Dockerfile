#FROM centos:7 AS base
#FROM alpine:latest AS base
FROM python:3

LABEL maintainer="max.radik@mail.ru"

RUN mkdir /http
WORKDIR /http
#RUN wget -O test_speed.zip http://speedtest.wdc01.softlayer.com/downloads/test10.zip
#FROM kramos/alpine-zip:latest AS zip

ADD http_test.py /http/http_test.py
ADD index.html /http/index.html
CMD [ "python3", "/http/http_test.py"]
