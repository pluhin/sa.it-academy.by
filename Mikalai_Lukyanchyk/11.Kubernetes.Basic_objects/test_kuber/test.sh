#!/bin/bash

REPO=<your_repo>
TOKEN=<tocken_to_add_github_runner>

cd /actions-runner

export RUNNER_ALLOW_RUNASROOT="1"

./config.sh --unattended --replace --url https://github.com/${REPO} --token ${TOKEN}

./run.sh & wait $!