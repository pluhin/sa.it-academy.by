FROM debian:stretch-slim


RUN apt update \
    && apt install -y python3 \
    && mkdir /python_app \
    && touch /python_app/connection.log

COPY server.py /python_app
COPY client.py /python_app

CMD ["python3", "/python_app/server.py"]


EXPOSE 9999

