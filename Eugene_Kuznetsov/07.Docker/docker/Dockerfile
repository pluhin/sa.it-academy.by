FROM python
RUN mkdir -p ./docker
WORKDIR ./docker
COPY . /docker
RUN pip3 install flask
CMD ["python3","tutorial1.py"]
