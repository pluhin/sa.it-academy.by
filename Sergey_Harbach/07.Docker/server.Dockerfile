FROM python:3.11-slim

LABEL maintainer="sgoser@gmail.com"

WORKDIR /server

COPY index.html ./
COPY server.py ./

EXPOSE 8000

ENTRYPOINT ["python", "server.py"]
