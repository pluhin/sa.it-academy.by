FROM python:3-alpine
MAINTAINER ivan.fanchenko@gmail.com
RUN apk update && apk add python3 
RUN pip3 install --no-cache-dir flask
ADD demosrv.py /
CMD [ "python3", "./demosrv.py" ]
EXPOSE 5000
