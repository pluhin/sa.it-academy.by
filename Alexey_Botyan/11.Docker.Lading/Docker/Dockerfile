FROM python:alpine3.7
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt && rm -f Dockerfile requirements.txt
EXPOSE 5000

CMD python ./app.py
