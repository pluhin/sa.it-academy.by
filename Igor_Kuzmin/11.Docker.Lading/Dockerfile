FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN pip install -r flask.txt
EXPOSE 5000
CMD python ./api.py