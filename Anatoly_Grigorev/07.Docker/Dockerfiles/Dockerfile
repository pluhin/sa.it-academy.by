FROM python:latest
RUN pip3 install Flask
RUN mkdir /app
COPY app.py /app
EXPOSE 5000
CMD ["flask","--app","/app/app.py","run","--host=0.0.0.0"]