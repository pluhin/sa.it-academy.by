#!/bin/bash

apt-get -y install podman curl jq gpg

podman completion -f "${fpath[1]}/_podman" zsh

[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.33.0/kind-linux-amd64
install -o root -g root -m 0755 kind /usr/local/bin/kind
kind completion zsh > "${fpath[1]}/_kind"

curl -LO https://dl.k8s.io/release/v1.37.0/bin/linux/amd64/kubectl
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl completion zsh > "${fpath[1]}/_kubectl"
echo "export KIND_EXPERIMENTAL_PROVIDER=podman" >> ~/.zshrc
source ~/.zshrc

cat << 'EOF' > /etc/nftables.conf
#!/usr/sbin/nft -f

flush ruleset

table ip filter {
        chain prerouting {
                type nat hook prerouting priority dstnat;
                iifname "ens18" ip daddr 192.168.37.150 tcp dport 80 counter dnat to 10.89.0.3:8080
                iifname "ens18" ip daddr 192.168.37.150 tcp dport 443 counter dnat to 10.89.0.3:8081
        }
}
EOF
systemctl enable --now nftables

wget "https://github.com/derailed/k9s/releases/download/v0.51.0/k9s_linux_amd64.deb"
apt install ./k9s_linux_amd64.deb

KIND_EXPERIMENTAL_PROVIDER=podman kind create cluster --config ./kind.yaml

#---------HELM----------
HELM_BUILDKITE_APT_KEY_ID="DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6"

curl -fsSL https://packages.buildkite.com/helm-linux/helm-debian/gpgkey > "${TMPDIR:-/tmp}/helm.asc"

if [ "$(gpg --import --import-options=show-only --with-colons "${TMPDIR:-/tmp}/helm.asc" \
        | awk -F: '$1 == "fpr" {print $10}' | head -n 1)" != "${HELM_BUILDKITE_APT_KEY_ID}" ]; then
    echo "ERROR: Unexpected Helm APT key ID: potential key compromise"
    exit 1
fi

sudo rm -f /etc/apt/sources.list.d/helm-stable-debian.list /usr/share/keyrings/helm.gpg

sudo install -m 0644 -Dt /etc/apt/keyrings/ "${TMPDIR:-/tmp}/helm.asc"

sudo tee /etc/apt/sources.list.d/helm-stable-debian.sources > /dev/null <<EOF
Types: deb
URIs: https://packages.buildkite.com/helm-linux/helm-debian/any/
Suites: any
Components: main
Signed-By: /etc/apt/keyrings/helm.asc
EOF

sudo apt-get update
sudo apt-get install helm
#---------HELM----------

#---------K8s util----------
helm repo add cilium https://helm.cilium.io/
helm repo update

GW_API="https://raw.githubusercontent.com/kubernetes-sigs/gateway-api/v1.6.1/config/crd/standard"

kubectl apply --server-side -f ${GW_API}/gateway.networking.k8s.io_gatewayclasses.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_gateways.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_httproutes.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_referencegrants.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_grpcroutes.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_backendtlspolicies.yaml \
  -f ${GW_API}/gateway.networking.k8s.io_tlsroutes.yaml

helm upgrade --install cilium -f ./cilium-values.yaml -n kube-system cilium/cilium --create-namespace --version 1.20.4

kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl create namespace argo-rollouts
kubectl apply -n argo-rollouts --server-side --force-conflicts -f https://github.com/argoproj/argo-rollouts/releases/latest/download/install.yaml
kubectl apply -f ./default-gateway.yaml -f ./argocd-tlsroute.yaml

# kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d