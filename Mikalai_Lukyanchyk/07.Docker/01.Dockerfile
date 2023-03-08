FROM python:3.11-slim

LABEL MAINTAINER="Mikalai Lukyanchyk"
LABEL description="A Docker container to serve a simple Python web server"

WORKDIR /server

RUN apt-get update \
    && apt-get upgrade 


COPY ./pages/* ./pages/
COPY main.py ./

EXPOSE 8081

ENTRYPOINT ["python", "main.py"] 
