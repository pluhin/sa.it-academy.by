FROM debian:stretch-slim

RUN apt update
RUN apt upgrade -y
RUN apt install -y samba nginx openssl git wget curl

RUN useradd -ms /bin/bash test
USER test
