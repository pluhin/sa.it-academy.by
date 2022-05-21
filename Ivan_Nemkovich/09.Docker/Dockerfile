FROM python:alpine3.15

LABEL maintainer="inemkovich@gmail.com"

RUN apk update \
    && pip install flask \
    && mkdir /api
COPY api.py /api/api.py
CMD ["python", "./api/api.py"]
EXPOSE 5000
