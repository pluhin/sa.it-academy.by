#!/bin/bash
## Need to run under regular user with sudo, not root!!!
RUN_VERSION='2.316.1'
RUN_REPO='pluhin/sa2-XX-XX'
RUN_TOKEN='XXXXXXXX'
sudo apt-get update && sudo apt upgrade -yqq && sudo apt -yqq install curl
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v${RUN_VERSION}/actions-runner-linux-x64-${RUN_VERSION}.tar.gz
tar xzf ./actions-runner-linux.tar.gz
./config.sh --name my_test_runner --labels linux,my_runner --runnergroup default --url https://github.com/${RUN_REPO} --token ${RUN_TOKEN}
./run.sh &
