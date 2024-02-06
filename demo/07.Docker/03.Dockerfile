FROM debian:buster-slim

RUN apt update
RUN apt install -y samba nginx openssl git wget curl

RUN apt remove -y samba openssl git wget curl
# everything but nginx

RUN useradd -ms /bin/bash test
USER test
