FROM ubuntu
RUN  apt-get -y update && apt-get -y upgrade && apt-get -y install python3-pip
COPY port_listener.py /home
CMD ["python3", "/home/port_listener.py"]
