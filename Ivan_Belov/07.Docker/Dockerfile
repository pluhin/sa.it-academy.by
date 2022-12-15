FROM python:3.8-slim-buster

COPY ./server.py ~/server.py

WORKDIR ~

EXPOSE 8888

ENTRYPOINT "python3" "server.py"
