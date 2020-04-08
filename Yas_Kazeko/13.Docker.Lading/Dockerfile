
FROM python:3.8-buster

ENV SITE my_site

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /"$SITE"
RUN     pip install django                      \
    &&  django-admin startproject "$SITE"       
CMD cd "$SITE" && python manage.py runserver 

EXPOSE 8000:8000