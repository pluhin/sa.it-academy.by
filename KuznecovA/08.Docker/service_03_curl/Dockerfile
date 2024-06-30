FROM python:3.7.9-slim-stretch

RUN mkdir -p /app/

# Установите рабочую директорию в /usr/src/app/
WORKDIR /app/

COPY script.sh /app/script.sh
RUN chmod +x /app/script.sh

ENTRYPOINT ["/app/script.sh"]