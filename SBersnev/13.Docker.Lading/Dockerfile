FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --update python py-pip
   
RUN mkdir /bersnev

COPY first.py /bersnev/first.py

EXPOSE 80

CMD ["first.py", "/bersnev/first.py"]
