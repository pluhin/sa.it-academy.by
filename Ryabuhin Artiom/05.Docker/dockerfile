FROM ubuntu:16.04

LABEL MAINTANER="maildrop@mail.ru"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev


# We copy just the requirements.txt first to leverage Docker cache

# COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt

RUN pip install -r requirements.txt

COPY . /app
