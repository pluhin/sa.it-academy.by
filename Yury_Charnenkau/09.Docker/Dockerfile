FROM python:3.11-rc

RUN pip install fastapi
RUN pip install uvicorn

ADD main.py .

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
