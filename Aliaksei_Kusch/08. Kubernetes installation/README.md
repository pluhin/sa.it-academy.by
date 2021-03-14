#kubectl installed
```bash
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt-get install -y kubectl
```

#k9s installed
```bash
git clone https://github.com/derailed/k9s.git
cd k9s/
make build && ./execs/k9s
```
