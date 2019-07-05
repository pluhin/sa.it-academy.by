#!/bin/bash
sudo apt install curl gnupg2 ca-certificates lsb-release
sleep 3
echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list
sleep 3
curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sleep 3
sudo apt-key fingerprint ABF5BD827BD9BF62
sleep 3
sudo apt update
