#!/bin/bash
## Need to run under regular user with sudo, not root!!!
RUN_VERSION='2.335.1'
RUN_REPO='VolhaSarkisova/10.Kubernetes'
RUN_TOKEN='BBDXNJAYAIKMXXXXXXXXXX'
apt-get update && apt upgrade -yqq && apt -yqq install curl
mkdir actions-runner_10 && cd actions-runner_10
curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v${RUN_VERSION}/actions-runner-linux-x64-${RUN_VERSION}.tar.gz
tar xzf ./actions-runner-linux.tar.gz
./config.sh --name my_test_runner_10 --labels linux,my_runner_10 --runnergroup default --url https://github.com/${RUN_REPO} --token ${RUN_TOKEN}
./run.sh &


