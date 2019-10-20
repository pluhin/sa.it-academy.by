FROM ubuntu

LABEL maintainer="ntwrkcoder"

RUN \
  apt-get update && \
  apt-get install -y python3 && \
  apt-get -y install python3-pip && \
  pip3 install flask

VOLUME ["/var/lib/pyprog/"]

COPY api.py /tmp/api.py

CMD python3 /tmp/api.py

EXPOSE 5555
