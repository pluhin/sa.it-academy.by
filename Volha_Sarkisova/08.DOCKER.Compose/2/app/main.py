from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from Docker multi-stage build!", "env": os.getenv("ENV", "development")}

@app.get("/health")
def health():
    return {"status": "ok"}
