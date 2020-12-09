FROM python:3.8.2

COPY web/requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY web/app.py /app/app.py

ENTRYPOINT [ "python3" ]

CMD [ "app.py" ]