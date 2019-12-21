FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && pak add --no-cache python py-pip bash
	
COPY server_ping.py /tmp/server_ping.py

WORKDIR /tmp

CMD ["python", "/tmp/server_ping.py"]

EXPOSE 8000
