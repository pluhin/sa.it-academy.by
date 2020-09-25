FROM centos:centos7 AS main
COPY . /opt/test
WORKDIR /opt/test
RUN yum install epel-release -y \
    && yum update -y \
    && yum install python3-pip -y \
    && pip3 install -r requirements.txt

CMD python3 /opt/test/api.py

EXPOSE 8080