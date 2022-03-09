FROM debian:jessie
ARG RUNNER_VERSION="2.278.0"

ENV GITHUB_PERSONAL_TOKEN ""
ENV GITHUB_OWNER ""
ENV GITHUB_REPOSITORY ""

RUN apt-get update \
    && apt-get install -y \
        curl \
        sudo \
        git \
        jq \
        tar \
        gnupg2 \
        apt-transport-https \
        ca-certificates  \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -m github && \
    usermod -aG sudo github && \
    echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER github
WORKDIR /home/github

RUN curl -O -L https://github.com/actions/runner/releases/download/v$RUNNER_VERSION/actions-runner-linux-x64-$RUNNER_VERSION.tar.gz
RUN tar xzf ./actions-runner-linux-x64-$RUNNER_VERSION.tar.gz
RUN sudo ./bin/installdependencies.sh

COPY --chown=github:github entrypoint.sh ./entrypoint.sh
RUN sudo chmod u+x ./entrypoint.sh

ENTRYPOINT ["/home/github/entrypoint.sh"]
