FROM python:3.11-slim

WORKDIR /application

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY get_time_app.py .

EXPOSE 2222

CMD ["python", "get_time_app.py"]
