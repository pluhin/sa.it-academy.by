FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python py-pip bash

RUN mkdir /var/lib/apisoft
RUN pip install Flack
COPY run.py /var/lib/apisoft

EXPOSE 5000

CMD ["python", "/var/lib/apisoft/run.py"]
