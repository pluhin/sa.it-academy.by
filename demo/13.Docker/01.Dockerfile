FROM debian:jessie

RUN apt-get update
RUN apt-get install -y samba nginx openssl git wget curl

RUN useradd -ms /bin/bash test
USER test
