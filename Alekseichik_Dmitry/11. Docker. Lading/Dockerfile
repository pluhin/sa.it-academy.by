FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache python py-pip bash\
    && mkdir /porter 
# install Pyton Flask addon
RUN pip install Flask

COPY port5000.py /porter/port5000.py

EXPOSE 5000

CMD ["python", "/porter/port5000.py"]
