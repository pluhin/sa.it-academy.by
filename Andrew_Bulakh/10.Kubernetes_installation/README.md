```bash
    name: Monitor Kubernetes Pods

     jobs:
       check-pods:
         runs-on: ubuntu-latest
         steps:
           - name: Checkout repository
             uses: actions/checkout@v4
           - name: Set up kubectl
             run: |
               echo "${{ secrets.KUBE_CONFIG }}" > kubeconfig
               export KUBECONFIG=$(pwd)/kubeconfig
           - name: Check pod status
             run: |
               if ! kubectl get pods --all-namespaces | grep -q 'Running'; then
                 curl -X POST -H 'Content-type: application/json' --data '{"text":"Alert: One or more pods are not running!"}' ${{ secrets.SLACK_WEBHOOK_URL }}
               fi
```