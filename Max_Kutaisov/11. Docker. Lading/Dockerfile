FROM alpine:latest
RUN apk add --update
RUN echo "**** install Python ****"
RUN apk add --no-cache python3
RUN echo "**** Python version ****"
RUN python3 --version
RUN echo "**** set EXPOSE ****"
EXPOSE 8000
RUN echo "**** COPY app_python ****"
COPY ./app_python /home/app_python
RUN echo "**** run Python ****"
RUN chmod +x /home/app_python/cgi-bin/hello.py
WORKDIR /home/app_python
CMD python3 -m http.server --cgi
