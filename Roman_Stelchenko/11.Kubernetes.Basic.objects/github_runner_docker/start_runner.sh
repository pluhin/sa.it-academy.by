#!/usr/bin/env bash
set -e

echo "Start github runner for ${GITHUB_RUNNER_URL}"

remove_runner() {
  echo "Removing runner configuration..."
  ./config.sh remove --token "${GITHUB_RUNNER_TOKEN}"
}
trap remove_runner EXIT

./config.sh --url "${GITHUB_RUNNER_URL}" --token "${GITHUB_RUNNER_TOKEN}"
./run.sh
