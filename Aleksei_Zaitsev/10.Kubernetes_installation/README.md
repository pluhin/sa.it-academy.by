#10. Kubernetes installation

```bash
kubectl get nodes
nano ~/.bashrc 
# add export KUBECONFIG=~/.kube/config-k8s to the end of file
kubectl get nodes
ssh root@192.168.208.7
nano ~/.kube/config-k8s 
# add current context
k9s
kubectl exec -it ubuntu-default -- bash
#runner installation
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.332.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.332.0/actions-runner-linux-x64-2.332.0.tar.gz
echo "f2094522a6b9afeab07ffb586d1eb3f190b6457074282796c497ce7dce9e0f2a  actions-runner-linux-x64-2.332.0.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.332.0.tar.gz
./config.sh --url https://github.com/ztsv-alexey/09.kubernetes --token BNVRCBDJVMCRRDVAWG2CEY3JVVQHW
./run.sh
# Add check pod status
kubectl get pods -A
nano .github/workflows/check.yml
git add .
git push origin main
git commit -m "Add check pods"
git push origin main
```