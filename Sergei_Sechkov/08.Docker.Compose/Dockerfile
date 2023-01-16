FROM  python:3-alpine AS builder

WORKDIR /webapp
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["python", "app.py"]
EXPOSE 80