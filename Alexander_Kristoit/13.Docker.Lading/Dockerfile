FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --update python py-pip

RUN pip install Flask

EXPOSE  8080

COPY test.py /src/test.py

CMD ["python", "/src/test.py", "-p 8080"]

