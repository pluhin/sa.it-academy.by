# Stage 1: Building the image with dependencies
FROM python:3.11-slim AS builder

WORKDIR /app
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Stage 2: Main image for the application

FROM python:3.11-slim


COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages

COPY PyApp.py .

ENV FLASK_APP=PyApp.py

EXPOSE 5000

CMD ["python", "PyApp.py"]