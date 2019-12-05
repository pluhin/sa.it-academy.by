FROM centos:latest

RUN yum -y update \
    && yum install -y python2 \
    && mkdir /usr/lib/echoserv
	
COPY echo-server.py /usr/lib/echoserv/echo-server.py

CMD ["python2", "/usr/lib/echoserv/echo-server.py"]

EXPOSE 9090
