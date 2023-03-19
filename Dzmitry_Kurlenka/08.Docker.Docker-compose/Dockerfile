FROM python:3.8-slim-buster

LABEL MAINTAINER="Dzmitry Kurlenka"

LABEL description="Python echo reply port"

WORKDIR /src

COPY src/app.py app.py

ENTRYPOINT "python3" "app.py"
