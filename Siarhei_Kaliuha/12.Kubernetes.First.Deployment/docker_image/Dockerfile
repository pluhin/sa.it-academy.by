FROM ubuntu:latest

ENV RUN_VERSION "2.294.0"
ENV RUN_TOKEN ""
ENV RUN_REPO ""

RUN apt-get update && apt upgrade -y \
    && apt install curl sudo jq -y \
    && useradd -m runner \
    && usermod -aG sudo runner \
    && echo "%sudo ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER runner

WORKDIR /home/runner

RUN mkdir actions-runner && cd actions-runner

RUN curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v${RUN_VERSION}/actions-runner-linux-x64-${RUN_VERSION}.tar.gz

RUN tar xzf ./actions-runner-linux.tar.gz && sudo ./bin/installdependencies.sh

COPY --chown=runner:runner startup.sh ./startup.sh
RUN sudo chmod u+x ./startup.sh

CMD ["./startup.sh"]
