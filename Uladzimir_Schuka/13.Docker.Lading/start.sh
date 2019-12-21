#!/bin/bash
app="docker.landing"
docker build -t ${app} .
docker run -d -p 5800:80 \
  --name=${app} \
  -v $PWD:/app ${app}