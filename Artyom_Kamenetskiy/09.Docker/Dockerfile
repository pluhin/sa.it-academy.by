FROM alpine:latest

LABEL maintaner="estello2k@gmail.com"

RUN apk update \
    && apk add python3 --no-cache

COPY ./gen.py /

CMD ["python3", "./gen.py"]