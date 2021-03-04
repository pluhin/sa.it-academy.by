FROM python:3.7.2-alpine3.8

RUN mkdir /script

COPY . /script

WORKDIR /script

ENV PYTHONUNBUFFERED=1

CMD ["python", "python.py"]
