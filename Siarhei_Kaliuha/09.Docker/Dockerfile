FROM python:3-alpine

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && pip3 install --no-cache flask

COPY flaskapi.py /flaskapi.py

EXPOSE 80

CMD ["python3",  "./flaskapi.py"]