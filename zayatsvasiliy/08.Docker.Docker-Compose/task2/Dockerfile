FROM python:3.11-slim AS builder
WORKDIR /app

COPY app.py .

RUN pip install --upgrade pip setuptools wheel \
    && python setup.py bdist_wheel || echo "setup.py"

RUN mkdir /build && cp app.py /build/

FROM python:3.11-slim AS runtime
WORKDIR /app

COPY --from=builder /build /app
ENTRYPOINT ["python", "app.py"]
