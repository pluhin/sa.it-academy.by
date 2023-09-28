#!/bin/bash
RUN_VERSION='2.309.0'
RUN_REPO='pluhin/sa2-25-23-git'
RUN_TOKEN='XXXXXXXXXXXXXXXXXXXX'
sudo apt-get update && sudo apt upgrade -y
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux.tar.gz -L https://github.com/actions/runner/releases/download/v${RUN_VERSION}/actions-runner-linux-x64-${RUN_VERSION}.tar.gz
tar xzf ./actions-runner-linux.tar.gz
./config.sh --name my_test_runner --labels linux,my_runner --runnergroup default --url https://github.com/${RUN_REPO} --token ${RUN_TOKEN}
./run.sh &
