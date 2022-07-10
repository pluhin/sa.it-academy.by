#!/bin/bash

# Create the runner and configure it
./config.sh --url https://github.com/$RUN_REPO --token $RUN_TOKEN --unattended --replace

# Run it
./run.sh "$*" &

wait $!
