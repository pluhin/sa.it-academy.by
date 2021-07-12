FROM alpine:latest
MAINTAINER kart-valery
RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && apk add --no-cache py3-pip 

COPY listen_port_9090.py /

CMD ["python3", "./listen_port_9090.py"]

EXPOSE 9090
