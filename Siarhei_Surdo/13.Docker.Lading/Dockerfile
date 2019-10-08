FROM ubuntu

RUN apt-get update \
    && apt-get install -y python \
    python-dev \
  && mkdir /usr/lib/pyserv \
  && rm -rf /var/cache/apk/*
	
COPY pyserv.py /usr/lib/pyserv/pyserv.py

CMD ["python", "/usr/lib/pyserv/pyserv.py"]

EXPOSE 20001/udp 20001

