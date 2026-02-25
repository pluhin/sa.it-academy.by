*Deploy shell pod in default namespace which you can you use for internal checks inside the cluster*

``` yaml
apiVersion: v1
kind: Pod
metadata:
  name: shell-pod
  namespace: default
  labels:
    app: shell
spec:
  restartPolicy: Never
  containers:
    - name: shell
      image: alpine:3.19
      command: ["/bin/sh", "-c", "sleep 86400"]
      resources:
        requests:
          memory: "32Mi"
          cpu: "50m"
        limits:
          memory: "64Mi"
          cpu: "100m"

```
*Run Pod*
```
 kubectl apply -f manifests/shell-pod.yaml --context k3s
```

his
```bash
kubectl get pods -A --context k3s
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
default       shell-pod                                 1/1     Running   0          6h42m
kube-system   coredns-695cbbfcb9-drzc2                  1/1     Running   0          5d17h
kube-system   local-path-provisioner-546dfc6456-26bg4   1/1     Running   0          5d17h
kube-system   metrics-server-c8774f4f4-ttxtk            1/1     Running   0          5d17h
```


# Create GitHub action to check status of pods and create slack notification if you have crashed/failed pods





1.Step. Register self-hosted github runner in remote repo 

```
mkdir actions-runner && cd actions-runner
  816  curl -o actions-runner-linux-x64-2.331.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz
  817  tar xzf ./actions-runner-linux-x64-2.331.0.tar.gz
  818  ./config.sh --url https://github.com/poteenoka/k8s_minikube_workflow --token key
  819  ./run.sh
```


2. Step. Create serets4 Slack Webhook

3. Step

Workflow4test  kubectlPods thure actions-runner  (create ssh tunnel + export env + check)

 
``` yaml
name: Pod status (k3s & k8s)

on:
  workflow_dispatch:

jobs:
  pod-status:
    runs-on: self-hosted
    steps:
      - name: Set KUBECONFIG and kill existing SSH tunnels
        run: |
          echo "KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config-k8s" >> $GITHUB_ENV
          pkill -f 'ssh -L 6443:127.0.0.1:6443 root@192.168.208.3' || true
          pkill -f 'ssh -L 6444:127.0.0.1:6444 root@192.168.203.2' || true
          sleep 2

      - name: Create SSH tunnels
        run: |
          ssh -o StrictHostKeyChecking=no -L 6443:127.0.0.1:6443 root@192.168.208.3 -f -N
          ssh -o StrictHostKeyChecking=no -L 6444:127.0.0.1:6444 root@192.168.203.2 -f -N
          sleep 1

      - name: List kubectl contexts
        run: kubectl config get-contexts

      - name: Check pod status (k3s)
        run: kubectl get pods -A --context k3s

      - name: Check pod status (k8s)
        run: kubectl get pods -A --context k8s

      - name: Fail if any pods not Ready
        id: check
        run: |
          failed=0
          for ctx in k3s k8s; do
            not_ready=$(kubectl get pods -A --context $ctx --no-headers 2>/dev/null | grep -v "Running\|Completed" | grep -v "^\s*$" || true)
            if [ -n "$not_ready" ]; then
              echo "Pods not Running/Completed in context $ctx:"
              echo "$not_ready"
              failed=1
            fi
          done
          [ $failed -eq 0 ] && echo "All pods Running or Completed in k3s and k8s." || exit 1

      - name: Notify Slack
        if: always()
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
          BUILD_SUCCESS: ${{ steps.check.outcome == 'success' }}
          RUN_URL: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}
          BRANCH: ${{ github.ref_name }}
        run: |
          if [ "$BUILD_SUCCESS" = "true" ]; then STATUS="succeeded"; else STATUS="failed"; fi
          payload=$(printf '{"text":"Pod status (k3s & k8s) %s | branch: %s | %s"}' "$STATUS" "$BRANCH" "$RUN_URL")
          curl -sS -X POST -H 'Content-type: application/json' --data "$payload" "$SLACK_WEBHOOK"

```


result Run Workflow   (https://github.com/poteenoka/k8s_minikube_workflow/actions/runs/22392945590/job/64819340498#step:4:7)

```
pod-status
succeeded 40 minutes ago in 16s
Search logs
0s
Current runner version: '2.331.0'
Runner name: 'ubuvm1'
Runner group name: 'Default'
Machine name: 'ubuvm1'
GITHUB_TOKEN Permissions
Secret source: Actions
Prepare workflow directory
Prepare all required actions
Complete job name: pod-status
2s
Run echo "KUBECONFIG=$HOME/.kube/config-k3s:$HOME/.kube/config-k8s" >> $GITHUB_ENV
7s
Run ssh -o StrictHostKeyChecking=no -L 6443:127.0.0.1:6443 root@192.168.208.3 -f -N
0s
Run kubectl config get-contexts
CURRENT   NAME   CLUSTER   AUTHINFO           NAMESPACE
          k3s    k3s       default            
          k8s    k8s       kubernetes-admin   
0s
Run kubectl get pods -A --context k3s
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
default       shell-pod                                 1/1     Running   0          6h34m
kube-system   coredns-695cbbfcb9-drzc2                  1/1     Running   0          5d17h
kube-system   local-path-provisioner-546dfc6456-26bg4   1/1     Running   0          5d17h
kube-system   metrics-server-c8774f4f4-ttxtk            1/1     Running   0          5d17h
0s
Run kubectl get pods -A --context k8s
NAMESPACE     NAME                                      READY   STATUS    RESTARTS   AGE
default       ubuntu-default                            1/1     Running   0          5d16h
kube-system   calico-kube-controllers-5bc89bc76-t84f7   1/1     Running   0          5d21h
kube-system   calico-node-28smm                         1/1     Running   0          5d21h
kube-system   calico-node-xs6jh                         1/1     Running   0          5d21h
kube-system   coredns-58cc5d8ddf-gxk2k                  1/1     Running   0          5d21h
kube-system   coredns-58cc5d8ddf-strc8                  1/1     Running   0          5d21h
kube-system   dns-autoscaler-5654b864c-kdvcv            1/1     Running   0          5d21h
kube-system   kube-apiserver-node1                      1/1     Running   1          5d21h
kube-system   kube-controller-manager-node1             1/1     Running   1          5d21h
kube-system   kube-proxy-k4pm2                          1/1     Running   0          5d21h
kube-system   kube-proxy-rw6w4                          1/1     Running   0          5d21h
kube-system   kube-scheduler-node1                      1/1     Running   0          5d21h
kube-system   nginx-proxy-node2                         1/1     Running   0          5d21h
kube-system   nodelocaldns-c5md2                        1/1     Running   0          5d21h
kube-system   nodelocaldns-lz8q5                        1/1     Running   0          5d21h
0s
Run failed=0
All pods Running or Completed in k3s and k8s.
1s
Run if [ "$BUILD_SUCCESS" = "true" ]; then STATUS="succeeded"; else STATUS="failed"; fi
  
ok
0s
Cleaning up orphan processes
Terminate orphan process: pid (97163) (ssh)
Terminate orphan process: pid (97164) (ssh)
Terminate orphan process: pid (97166) (ssh)
Terminate orphan process: pid (97167) (ssh)
```


slack notify

```
simplenote  [1:21 PM]
Pod status (k3s) failed | branch: main | https://github.com/poteenoka/k8s_minikube_workflow/actions/runs/22392378193
[1:22 PM]Pod status (k3s) failed | branch: main | https://github.com/poteenoka/k8s_minikube_workflow/actions/runs/22392554187
simplenote  [1:28 PM]
Pod status (k3s) failed | branch: main | https://github.com/poteenoka/k8s_minikube_workflow/actions/runs/22392763666
[1:33 PM]Pod status (k3s & k8s) succeeded | branch: main | https://github.com/poteenoka/k8s_minikube_workflow/actions/runs/22392945590
```