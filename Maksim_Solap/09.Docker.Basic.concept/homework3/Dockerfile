
# === Этап1: сборка и подготовка зависимостей(Build stage) ===
FROM python:3.10-slim AS builder

WORKDIR /build

# установление зависимостей в отдельную папку (wheel)
RUN pip install --no-cache-dir wheel && \
    pip install --no-cache-dir --user flask


# === Этап2: Минимальный финальный образ (Runtime stage) =====

FROM python:3.10-slim AS runner
 
WORKDIR /app

# копируем только установленные библиотеки из первого этапа(из папки .local)
COPY --from=builder /root/.local /root/.local

COPY app.py .

# добавляем путь к установленным пакетам в окружение
ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000

CMD ["python", "app.py"]
