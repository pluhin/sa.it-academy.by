FROM alpine:latest

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

#RUN pip install Flask

#EXPOSE  65432

#COPY echo-server.py /src/echo-server.py

#CMD ["python", "/src/echo-server.py"]

ENV UDPPORT 5005
ADD udplistener.py /udplistener.py
CMD ["python", "-u","/udplistener.py"]

EXPOSE ${UDPPORT}
EXPOSE ${UDPPORT}/udp
