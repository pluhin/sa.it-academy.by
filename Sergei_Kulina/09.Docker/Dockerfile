#FROM debian:stretch-slim
FROM python:3-alpine
#RUN apt update \
#    && apt install --no-install-recommends --no-install-suggests -y python3 python3-pip \
#    && apt remove --purge --auto-remove -y python3 python3-pip \
#    && rm -rf /var/lib/apt/lists/* \
#    $$ mkdir test
# Clear up the cache also
   
COPY port2.py /test/port.py

CMD ["python","/test/port.py"]

