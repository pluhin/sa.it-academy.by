FROM centos:latest

MAINTAINER alexlasicki

RUN yum install epel-release -y \
    && yum update -y \
    && yum install python3-pip -y

RUN mkdir /pl

COPY port_listner.py /pl/portlistner.py

CMD ["python3", "/pl/portlistner.py"]


EXPOSE 8034
