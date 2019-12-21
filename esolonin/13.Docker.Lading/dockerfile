FROM centos

MAINTAINER esolonin

RUN \
  yum install epel-release -y && \
  yum update -y && \
  yum install python3-pip -y

RUN mkdir /listener

COPY socket_listen.py /listener/socket_listen.py

CMD ["python3", "/listener/socket_listen.py"]


EXPOSE 8899

