FROM python:3.9-slim

RUN useradd -m myuser

WORKDIR /app
COPY app.py .
RUN pip install flask && \
    chown -R myuser:myuser /app

USER myuser

CMD ["python", "app.py"]