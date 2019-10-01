FROM alpine:latest
EXPOSE 5000
RUN apk update \
    && apk upgrade \
    && apk add --no-cache python3 \
    && pip3 install --no-cache --upgrade pip \
    && pip3 install flask
COPY web_app.py /app/web_app.py
CMD python3 /app/web_app.py
