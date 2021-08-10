FROM alpine:latest

MAINTAINER Mat_Zhenya

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip

COPY lis.py /

CMD ["python3", "./lis.py"]

EXPOSE 7788


