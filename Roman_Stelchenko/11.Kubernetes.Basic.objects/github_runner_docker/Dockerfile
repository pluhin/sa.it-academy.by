FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y \
      curl \
      jq \
      git \
      ca-certificates \
      sudo \
      bash && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/actions-runner

RUN curl -o actions-runner-linux-x64-2.329.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.329.0/actions-runner-linux-x64-2.329.0.tar.gz \
 && echo "194f1e1e4bd02f80b7e9633fc546084d8d4e19f3928a324d512ea53430102e1d  actions-runner-linux-x64-2.329.0.tar.gz" | shasum -a 256 -c \
 && tar xzf ./actions-runner-linux-x64-2.329.0.tar.gz \
 && rm actions-runner-linux-x64-2.329.0.tar.gz

RUN ./bin/installdependencies.sh

COPY start_runner.sh /opt/actions-runner/start_runner.sh

RUN useradd -m github_runner \
 && echo "github_runner ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN chown github_runner:github_runner /opt/actions-runner/start_runner.sh \
 && chmod +x /opt/actions-runner/start_runner.sh \
 && chown -R github_runner:github_runner /opt/actions-runner

USER github_runner

ENTRYPOINT ["./start_runner.sh"]
