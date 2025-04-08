FROM debian:bullseye

# System update and dependency installation
RUN apt-get update && apt-get install -y python3 python3-pip nginx && apt-get clean && rm -rf /var/lib/apt/lists/*

#Installation of Python dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copying app and config
COPY app.py /app/app.py
COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /app

# Open port
EXPOSE 80

# Run Flask
CMD service nginx start && gunicorn -w 4 -b 127.0.0.1:8000 app:app
