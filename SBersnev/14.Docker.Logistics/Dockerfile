FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --update python py-pip

RUN pip install Flask

EXPOSE  8080

COPY 1.py /src/1.py

CMD ["python", "/src/1.py", "-p 8080"]
