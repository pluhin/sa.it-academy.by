# Стадия сборки
FROM python:3.8 AS builder
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt

# Стадия выполнения
FROM python:3.8-slim AS runtime
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 5000
CMD ["python", "app.py"]
