#### 09.K8s
#
#
#
#### Links


[GitHub Action File](https://github.com/chicaragua/ITA/blob/master/.github/workflows/09.K8s.yml)
#
[GitHub Action Workflow](https://github.com/chicaragua/ITA/actions/runs/3726336526)
#


#### Report
#
##### Munikube
#
 ```
 REPORT Munikube install job:

Client Version: v1.26.0
Kustomize Version: v4.5.7
Server Version: v1.25.3

List nodes:
NAME              STATUS   AGE
default           Active   20s
kube-node-lease   Active   21s
kube-public       Active   21s
kube-system       Active   21s

Count nodes:
4
        
Usage time (sec): 86
```
#
##### Kind
#
```bash
REPORT Kind install job:

Client Version: v1.23.12
Server Version: v1.25.2

List nodes:
NAME                 STATUS   AGE
default              Active   22s
kube-node-lease      Active   24s
kube-public          Active   24s
kube-system          Active   24s
local-path-storage   Active   18s

Count nodes:
5
        
Usage time (sec): 59
```
