
FROM python:3.11-slim

WORKDIR /server

RUN apt-get update \
    && apt-get upgrade 


COPY calc.py ./


ENTRYPOINT ["python", "calc.py"] 
