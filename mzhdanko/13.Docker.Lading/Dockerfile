FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python py-pip bash\
    && mkdir /application

RUN pip install Flask

COPY pythonapplication.py /application/pythonapplication.py

EXPOSE 8181

CMD ["python", "/application/pythonapplication.py"]
