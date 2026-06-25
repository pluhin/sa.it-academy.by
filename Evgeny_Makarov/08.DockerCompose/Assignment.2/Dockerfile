# =========================
# 1. Build stage
# =========================
FROM python:3.11-slim AS builder

WORKDIR /app

COPY app/requirements.txt .

RUN pip install --user --no-cache-dir -r requirements.txt


# =========================
# 2. Runtime stage
# =========================
FROM python:3.11-slim

WORKDIR /app

# копируем только зависимости из builder
COPY --from=builder /root/.local /root/.local

# добавляем app
COPY app/ .

ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000

CMD ["python", "app.py"]
