FROM python:3.7.4-alpine
MAINTAINER Viktor Lepeshko "lepvv@mail.ru"
WORKDIR /project
ADD . /project
RUN pip install -r requirements.txt
CMD ["python","app.py"]
