FROM python:3.7.3-alpine3.9
MAINTAINER albert
ARG proxy
ENV https_proxy=$proxy \
	LANG=en_US.UTF-8 \
	LC_ALL=en_US.UTF-8
COPY src /apps
WORKDIR /apps
RUN python -V
CMD ["sh","/apps/bootstrap.sh"]
