FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /root/.local /root/.local
COPY app.py .

ENV PATH=/root/.local/bin:$PATH
EXPOSE 5000
CMD ["python", "app.py"]

