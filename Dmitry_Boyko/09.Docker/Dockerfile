FROM python:alpine
RUN mkdir /app
ADD ./server.py /app/server.py
WORKDIR /app
CMD ["python", "server.py", "80"]
