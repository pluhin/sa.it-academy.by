FROM alpine:3.9
MAINTAINER Albert

RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /data
COPY . /data/

EXPOSE 5000
CMD ["bash"]