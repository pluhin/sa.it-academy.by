FROM jenkins/jenkins:latest AS jenkins_cli

LABEL maintainer="pluhin@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_VERSION="2.9"

RUN /usr/local/bin/install-plugins.sh ssh-slaves \
        email-ext \
        mailer \
        greenballs \
        simple-theme-plugin \
        parameterized-trigger \
        rebuild \
        github \
        multiple-scms \
        ansicolor \
        blueocean \
        stashNotifier \
        configuration-as-code \
        show-build-parameters \
        credentials \
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
        && /bin/sh -c 'apt-get install -y aptitude' \
        && apt-get install -yqq --no-install-recommends \
        dnsutils \
        file \
        gnupg \
        locales \
        && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
        && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" \
        && apt-get update \
        && git config --global core.sshCommand 'ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no' \
        && apt-get -y install docker-ce -qq \
        && gpasswd -a jenkins docker \
        && newgrp docker \
        && echo "    StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
        && echo "    UserKnownHostsFile=/dev/null" >> /etc/ssh/ssh_config \
        && apt-get install rsync -y \
        && apt-get purge --auto-remove -yqq \
        && apt-get clean \
        && rm -rf \
            /var/lib/apt/lists/* \
            /tmp/* \
            /var/tmp/* \
            /usr/share/man \
            /usr/share/doc \
            /usr/share/doc-base

RUN echo "jenkins       ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers \
    && echo "DOCKER_OPTS=' -G jenkins'" >> /etc/default/docker \
    && usermod -a -G docker jenkins
USER jenkins