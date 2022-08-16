FROM python:3.10-slim-buster
WORKDIR /app

RUN pip install fastapi
RUN pip install "uvicorn[standard]"

COPY . .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
