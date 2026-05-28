# ========== СТАДИЯ 1: BUILD ==========
FROM python:3.11-slim AS builder

WORKDIR /build

# Устанавливаем зависимости для сборки (если нужен компилятор)
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Копируем и устанавливаем зависимости в виртуальное окружение
COPY requirements.txt .
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --no-cache-dir -r requirements.txt

# ========== СТАДИЯ 2: RUNTIME ==========
FROM python:3.11-slim AS runtime

# Создаем непривилегированного пользователя
RUN addgroup --system app && adduser --system --group app

# Копируем виртуальное окружение из стадии builder
COPY --from=builder /opt/venv /opt/venv

# Копируем код приложения
WORKDIR /app
COPY app/ .

# Настраиваем PATH для использования виртуального окружения
ENV PATH="/opt/venv/bin:$PATH"

# Переключаемся на непривилегированного пользователя
USER app

# Порт для приложения
EXPOSE 8000

# Запуск приложения
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
