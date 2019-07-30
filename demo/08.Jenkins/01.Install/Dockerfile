FROM jenkins/jenkins:latest

LABEL maintainer="pluhin@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

# install plugins
RUN /usr/local/bin/install-plugins.sh ssh-slaves \
	email-ext \
	mailer \
	greenballs \
	simple-theme-plugin \
	parameterized-trigger \
	rebuild \
	github \
	mask-passwords \
	multiple-scms \
	ansicolor \
	blueocean \
	stashNotifier \
	show-build-parameters \
	credentials \
	configuration-as-code-support \
	configuration-as-code \
    slack
USER root

RUN apt-get update && apt-get install -yqq apt-transport-https \
		python-pip \
		sshpass \
		ca-certificates \
		curl \
		gnupg2 \
        wget \
		software-properties-common \
	&& pip install ansible==2.8 -qq \
		awscli \
	&& curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
	&& apt-get update \
	&& git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' \
	&& apt-get -y install docker-ce -qq \
    && apt-get install rsync -y \
	&& gpasswd -a jenkins docker \
	&& usermod -a -G docker jenkins \
    && newgrp docker \
	&& echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
	&& echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config \
    && apt-get purge --auto-remove -yqq \
	&& apt-get clean \
	&& rm -rf \
	    /var/lib/apt/lists/* \
	    /tmp/* \
	    /var/tmp/* \
	    /usr/share/man \
	    /usr/share/doc \
	    /usr/share/doc-base
RUN (echo 'jenkins            ALL = (ALL) NOPASSWD: ALL' > /etc/sudoers.d/jenkinsnosudo &&\
     chmod 0440 /etc/sudoers.d/jenkinsnosudo)

USER jenkins
