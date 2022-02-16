FROM alpine:latest
MAINTAINER Roman Navitsky
RUN apk update && apk add python3 
ADD my-server.py /
CMD [ "python3", "./my-server.py" ]
EXPOSE 9090