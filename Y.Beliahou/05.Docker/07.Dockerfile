FROM alpine:latest

MAINTAINER Y.Belyagov

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip \
    && mkdir /apiPython

COPY apy.py /apyPython/apy.py

CMD ["python3", "/apyPython/apy.py"]

EXPOSE 65432
