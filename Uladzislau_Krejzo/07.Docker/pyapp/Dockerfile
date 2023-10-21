FROM python:3.9
WORKDIR /pyapp
COPY requirments.txt requirments.txt
RUN pip install -r requirments.txt
COPY . .
ENV  FLASK_APP=app.py
ENV FLASK_ENV=development
EXPOSE 5000
CMD ["flask","run","-host=0.0.0.0"]

