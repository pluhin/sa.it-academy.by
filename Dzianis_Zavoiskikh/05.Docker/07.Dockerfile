#Compact base with python found
FROM python:3.7.2-alpine3.8

LABEL maintainer="6557587@gmail.com"

#installing the python libraries we need
RUN pip install --upgrade pip
RUN pip3 install sockets

#creating & going into the working directory
RUN mkdir /test
WORKDIR /test

#copy the listening-echo script from host
COPY serv3.py /test/serv3.py

#starting listening-echo script
CMD ["python3", "/test/serv3.py"]

#expose the port for listening
EXPOSE 5005
