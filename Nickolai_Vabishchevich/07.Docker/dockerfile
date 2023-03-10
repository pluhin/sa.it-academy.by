FROM python:3.8-slim-buster

COPY ./listener.py ~/listener.py

WORKDIR ~

EXPOSE 8484

ENTRYPOINT "python3" "listener.py"
