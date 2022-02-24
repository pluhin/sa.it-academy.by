kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.7.1/cert-manager.yaml

kubectl apply -f https://github.com/actions-runner-controller/actions-runner-controller/releases/download/v0.20.2/actions-runner-controller.yaml

kubectl create secret generic controller-manager \
    -n actions-runner-system \
    --from-literal=github_token=${TOKEN}

kubectl apply -f github-runner.yaml

kubectl get runners
