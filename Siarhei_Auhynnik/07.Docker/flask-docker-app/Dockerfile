# Base Python image
FROM python:3.11-slim

# Working directory inside the container
WORKDIR /app

# Installing dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copying application code
COPY app.py .

# Opening port
EXPOSE 5000

# Run command
CMD ["python", "app.py"]
