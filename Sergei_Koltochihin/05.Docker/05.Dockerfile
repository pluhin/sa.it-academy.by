FROM python:3

RUN mkdir /test

COPY . /test

CMD python /test/python_listener.py 9003

EXPOSE 9003
