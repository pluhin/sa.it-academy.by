FROM python:3.7.3-alpine3.9
MAINTAINER albert
ENV https_proxy=$proxy \
	LANG=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8
    
COPY pip /apps
WORKDIR  /apps
RUN python -V
RUN pip install && pip install cryptography && pip install pipenv && pipenv install
CMD ["sh","/apps/bootstrap.sh"]
