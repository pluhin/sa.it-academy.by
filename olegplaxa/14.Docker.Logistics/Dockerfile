FROM centos

LABEL maintainer="plaxaoleg@gmail.com"

RUN \
  yum install epel-release -y && \
  yum update -y && \
  yum install python3-pip -y && \
  pip3 install flask

COPY myapp.py /tmp/myapp.py

CMD ["python3", "/tmp/myapp.py"]

EXPOSE 7777