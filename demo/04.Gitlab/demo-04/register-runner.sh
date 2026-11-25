#!/usr/bin/env bash
set -euo pipefail

GITLAB_URL="${GITLAB_URL:-https://gitlab.com/}"
RUNNER_TOKEN="${RUNNER_TOKEN:?export RUNNER_TOKEN=glrt-... (см. шаг 3 в runner-setup.md)}"
DEFAULT_IMAGE="${DEFAULT_IMAGE:-alpine:3.20}"
CONCURRENT="${CONCURRENT:-4}"

# --- 1. Docker (нужен для executor=docker) ---------------------------------
if ! command -v docker >/dev/null 2>&1; then
  echo "==> Installing Docker"
  . /etc/os-release
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl
  sudo install -m 0755 -d /etc/apt/keyrings
  sudo curl -fsSL "https://download.docker.com/linux/${ID}/gpg" -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
https://download.docker.com/linux/${ID} ${VERSION_CODENAME} stable" \
    | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
else
  echo "==> Docker already installed: $(docker --version)"
fi

# --- 2. GitLab Runner ------------------------------------------------------
if ! command -v gitlab-runner >/dev/null 2>&1; then
  echo "==> Installing gitlab-runner"
  curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash
  sudo apt-get install -y gitlab-runner
else
  echo "==> gitlab-runner already installed: $(gitlab-runner --version | head -1)"
fi

# Чтобы job'ы могли обращаться к docker-сокету хоста (если понадобится).
sudo usermod -aG docker gitlab-runner || true

# --- 3. Регистрация --------------------------------------------------------
echo "==> Registering runner at ${GITLAB_URL}"
sudo gitlab-runner register \
  --non-interactive \
  --url "$GITLAB_URL" \
  --token "$RUNNER_TOKEN" \
  --executor "docker" \
  --docker-image "$DEFAULT_IMAGE" \
  --docker-volumes "/var/run/docker.sock:/var/run/docker.sock"

# --- 4. Параллелизм и рестарт ---------------------------------------------
sudo sed -i "s/^concurrent = .*/concurrent = ${CONCURRENT}/" /etc/gitlab-runner/config.toml
sudo systemctl restart gitlab-runner

# --- 5. Проверка -----------------------------------------------------------
sudo gitlab-runner list
sudo gitlab-runner verify
