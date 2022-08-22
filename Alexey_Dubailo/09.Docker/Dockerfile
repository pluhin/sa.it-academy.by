FROM python:3.7.13-alpine3.16
RUN apk update && apk add python3
RUN pip install --upgrade pip
RUN pip3 install --no-cache-dir bottle
ADD runme.py /
CMD [ "python3", "./runme.py" ]
EXPOSE 8080