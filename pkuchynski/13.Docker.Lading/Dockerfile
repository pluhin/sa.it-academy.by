FROM python:3-alpine
MAINTAINER pawelk

RUN apk update && \
    apk upgrade && \
    python -m pip install --upgrade pip && \
    pip3 install flask

RUN mkdir /server

COPY server.py /server/server.py

CMD ["python3","/server/server.py"]

EXPOSE 8080 
  
