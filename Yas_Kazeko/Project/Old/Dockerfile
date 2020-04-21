
FROM python:3.8-alpine

ENV SITE mysite

ENV DEBIAN_FRONTEND noninteractive

COPY mysite/ /mysite/

RUN pip install -r mysite/requirements.txt

CMD cd "$SITE" && python manage.py runserver 0.0.0.0:8000

EXPOSE 8000
