FROM python:3.11-slim as builder

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends binutils && \
    rm -rf /var/lib/apt/lists/*

COPY main.py .

RUN pip install --no-cache-dir pyinstaller && \
    pyinstaller --onefile --name myapp --clean main.py

FROM debian:stable-slim
COPY --from=builder /app/dist/myapp /usr/local/bin/myapp
CMD ["/usr/local/bin/myapp"]
