FROM python:3.8-alpine3.13

RUN pip install requests
RUN apk add --update --no-cache netcat-openbsd

COPY exchange.py /

CMD [ "python", "./exchange.py" ]

EXPOSE 2021
