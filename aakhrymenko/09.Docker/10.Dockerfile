FROM python:3

ADD tcp_listener.py /

CMD [ "python", "./tcp_listener.py", "--host=0.0.0.0" ]

