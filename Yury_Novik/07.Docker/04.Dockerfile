FROM debian:buster-slim

RUN apt update \
    && apt install --no-install-recommends --no-install-suggests -y samba nginx openssl git wget curl \
    && apt remove --purge --auto-remove -y samba openssl git wget curl \
    && rm -rf /var/lib/apt/lists/*
    # Clear up the cache also

USER www-data
