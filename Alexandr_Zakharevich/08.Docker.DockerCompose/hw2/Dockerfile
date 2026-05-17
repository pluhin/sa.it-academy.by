# СТАДИЯ 1: Сборка (build stage)
FROM python:3.11-slim AS builder

WORKDIR /build

# Устанавливаем Flask в изолированную директорию
RUN pip install --prefix=/install flask

# Копируем исходный код
COPY app.py .

# Проверяем синтаксис (имитация сборки)
RUN python -m py_compile app.py && \
    echo "Сборка завершена успешно"

# СТАДИЯ 2: Выполнение (runtime stage)
FROM python:3.11-slim AS runtime

WORKDIR /app

# Копируем только установленные зависимости со стадии сборки
COPY --from=builder /install /usr/local

# Копируем исходный код (для веб-приложений .py удобнее, чем .pyc)
COPY --from=builder /build/app.py /app/app.py

# Указываем порт, который слушает Flask
EXPOSE 5000

# Запускаем приложение напрямую
CMD ["python", "app.py"]