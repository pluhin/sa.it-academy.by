FROM ubuntu:20.04

LABEL MAINTAINER="Mikalai Lukyanchyk"
LABEL description="A Docker container to serve a simple ubuntu server"

ARG RUNNER_VERSION="2.303.0"

WORKDIR /actions-runner

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update && apt upgrade -yqq
RUN apt install -yqq mc vim curl wget git telnet netcat \
	&& apt-get purge --auto-remove -yqq \
	&& apt-get clean \
	&& rm -rf \
	/var/lib/apt/lists/* \
	/tmp/* \
	/var/tmp/* \
	/usr/share/man \
	/usr/share/doc \
	/usr/share/doc-base

RUN curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
	&& tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
	&& rm ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

COPY test.sh ./

RUN chmod +x test.sh

ENTRYPOINT ["./test.sh"]
