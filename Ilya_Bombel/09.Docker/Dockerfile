FROM python:3-alpine
MAINTAINER ilya.bombel@gmail.com
RUN apk update && apk add python3 
RUN pip3 install --no-cache-dir flask
ADD myapp.py /
CMD [ "python3", "./myapp.py" ]
EXPOSE 5000