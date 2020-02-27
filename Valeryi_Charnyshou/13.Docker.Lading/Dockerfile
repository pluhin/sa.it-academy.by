FROM alpine:latest

RUN apk add --update python

#CMD mkdir /portlistener/

COPY port_listener.py /



EXPOSE 5555

CMD python /port_listener.py
