FROM python:3.11-slim as builder
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY app.py .


FROM python:3.11-slim
WORKDIR /app

# Copy dependencies and application from the build stage
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY --from=builder /app /app

# Expose port and set entrypoint
EXPOSE 5000
CMD ["python", "app.py"]

