FROM python:3.8
MAINTAINER Eduard Linkevich <edlink911@gmail.com>

WORKDIR /app

COPY ./requirements.txt ./
RUN pip3 install -r ./requirements.txt

COPY . /app
WORKDIR /app

ENTRYPOINT python main.py
