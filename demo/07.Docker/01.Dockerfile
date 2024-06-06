FROM debian:buster

RUN apt-get update
RUN apt-get install -y samba nginx openssl git wget curl
