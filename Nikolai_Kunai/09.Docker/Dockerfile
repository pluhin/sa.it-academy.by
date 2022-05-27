FROM python:3.9.3-alpine

WORKDIR /app

COPY myapp.py .

RUN pip install flask --upgrade pip

EXPOSE 80

CMD ["python", "myapp.py"]