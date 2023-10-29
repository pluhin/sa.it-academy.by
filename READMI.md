   cd 08.Docker/
   20  ll
   21  > cluster-config.yaml
   22  nano cluster-config.yaml
   23  kind create cluster --config cluster-config.yaml
   24  [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
   25  chmod +x ./kind
   26  sudo mv ./kind /usr/local/bin/kind
   27  kubectl version --client
   28  kind create cluster --name test-cluster --config cluster-config.yaml
   30  kubectl cluster-info --context kind-test-cluster
   31  kubectl get nodes
   32  wget https://download.virtualbox.org/virtualbox/7.0.12/virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
   33  sudo dpkg -i virtualbox-7.0_7.0.12-159484\~Ubuntu\~jammy_amd64.deb
   35  kubectl cluster-info
   36  kubectl get nodes
   38  kubectl cluster-info --context kind-test-cluster
   60  mkdir -p .github/workflows/
   61  cd .github/workflows/
   62  ll
   64  nano kind-cluster.yaml
   65  nano minikub-cluster.yml
   67  nano kind-cluster.yml
   69  mv kind-cluster.yaml kind-cluster.yml 
