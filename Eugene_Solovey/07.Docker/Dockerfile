FROM python:3.11-slim

LABEL maintainer="evgeniy.colovey@gmail.com"

WORKDIR /server

COPY server.py ./

EXPOSE 8080

ENTRYPOINT ["python", "server.py"]
