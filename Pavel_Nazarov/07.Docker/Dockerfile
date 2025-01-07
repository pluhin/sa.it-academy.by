FROM python:3.9-slim

WORKDIR /app
COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

# Opening 5000 port
EXPOSE 5000

# Running app
CMD ["python", "app.py"]