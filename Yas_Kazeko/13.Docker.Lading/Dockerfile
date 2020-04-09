
FROM python:3.8-alpine

ENV SITE mysite

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN     pip install django 

COPY mysite/ /mysite/

CMD cd "$SITE" && python manage.py runserver 0.0.0.0:8000

EXPOSE 8000:8000
