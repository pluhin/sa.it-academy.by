FROM python:3.13.1-slim-bookworm

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY myapp.py .

EXPOSE 5000

CMD ["python", "myapp.py"]
