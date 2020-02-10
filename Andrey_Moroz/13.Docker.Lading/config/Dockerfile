FROM centos:7

RUN yum -y update \
    && yum -y upgrade \
    && mkdir -p /app/run \
    && yum -y install python3.x86_64

COPY listen_port.py /app/run/listen_port.py

RUN chmod +x /app/run/listen_port.py
