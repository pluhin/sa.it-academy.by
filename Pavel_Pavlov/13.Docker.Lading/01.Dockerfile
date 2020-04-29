FROM python:3.7-alpine3.11

WORKDIR /usr/src/app

EXPOSE 9090

COPY . .

CMD [ "python", "./pl.py" ]