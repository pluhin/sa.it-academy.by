FROM centos:latest

MAINTAINER alexandrandreenko

RUN yum install epel-release -y \
    && yum update -y \
    && yum install python3-pip -y \
    && mkdir /www

COPY script.py /www/script.py

CMD ["python3", "/www/script.py"]

EXPOSE 8080
