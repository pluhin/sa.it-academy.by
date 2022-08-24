# Kubernetes First deployment
## Ngnix app
Manifest [nginx-app.yaml](nginx-app.yaml)
## Screenshots
<dv>
<img src="https://dub01pap001files.storage.live.com/y4moHVnccsOuILLLcE-CzrKgsqPcJQuOYUIRyA2Hdb1bZV-4Ye1euwVewE9sABKYgOFI4i8-UmVTeFNsu-ZFJDIMVCWWoYHS5ty4CFckUguyECF8tAN1-Do0W7XNBYSR3LP2BfVK8IVOPBcY9-1sdIy_vrNf-s30twa6n6naIVGacFRIrXcRqp2V2T2PW2ydjOV?width=645&height=379&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4m5Qw3Mwx5fX6u38Y3GP1f8IjN1MbvLXxpUdqoR2CxKGGjuh0i6-sL2Y0a65jOtz2HXfancP-oTAfgbtPgZbKacr9cB9-IZBXLSGQIofPcY7Tdq1O3Kb_yUf9aaZcDUmqzwCz84ZUsWdiAomzV9OGaeld1_JY_qy62iP7xoH0dK67RejvMte723fJxd_A4ksiQ?width=670&height=409&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4mhOUlE9DZSTvPAYWT81HtxJF68nhd8J5GgNY5rCYIBFcqTYoPVjd2HyhmSGjrTbwNz3Ae6vzefzddRepZoNsXyLrZRkwUWCXA2vK5wepj1knJbHIKoAl1ZmovSEROPlHzyrkHIjKqcUsVjEAlwfWb97JyJxyBxZ7d4eWvgyUZc-hLymkicHvMeXlbDhfvifjx?width=1621&height=903&cropmode=none" width="auto" height="auto" />
</dv>

---

## Addition task
For deployment GitHub action runner I used this repository:
[https://github.com/actions-runner-controller/actions-runner-controller.git](https://github.com/actions-runner-controller/actions-runner-controller.git)

Manifest [runnerdeployment.yaml](runnerdeployment.yaml)

### Screenshots

<dv>
<img src="https://dub01pap001files.storage.live.com/y4mDmkXKZk8bkRZStSgHZXzqBjV971mj-y3Kcw_KyCTzjQMWMlHo0j1KhMnvv3qAf2RWF7AoUQRJmbEnP1Ht-gILRH5BbZ_KR6DmPZ2vPueKBIqg_rEHgZyH_s4ybo4myNgWrzLJehpCnJSe7daPhk5SJtjZv1ojOBXu9j3tB24aA6IHYede3W4O3LxcUQi239r?width=2160&height=591&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4meqKLI52JeJp5ON1TvfiRxdTAFtGWTn9msBYe3Y-VPG59p8xzkT9yfxL4cjIMEiucOk8aj-WNLqNVLKkq5NfP8Z0_boy1cJPMpW45w1HA9VsnJ9EmUbOu-CQrUYDBK_5FoPRe0XVDPNevQS_tzsnGJZrM8ZjrJBjw487n60fOw1JQonmKJJ7-N4OReGlzU0Lv?width=2221&height=1165&cropmode=none" width="auto" height="auto" />
</dv>

<dv>
<img src="https://dub01pap001files.storage.live.com/y4mx3hkNECfvLcAS_1V2BE8dYyQXbttJmL1Rx0E22M6ZYQSqIKutWdZxC6XkjfUNjphkGLSiVm95-sqpCZ4PKyR_wG4edabk37N91Uc2RQ7YPkzVw1alX2ao4qf4lGDBtuoA6K6kYG2U2PZWXEyqFpSTUf7WgoDMsRYDPVdlpcm46EN9JsyfQ3EW1BMdz2e7VCf?width=2227&height=1170&cropmode=none" width="auto" height="auto" />
</dv>

---
## History
```bash
  638  ssh -o ProxyCommand="ssh -W %h:%p -q jump_sa@178.124.206.53" -L 6443:127.0.0.1:6443 root@192.168.203.25 -f -N
  639  cd /mnt/d/Projects/12.Kubernetes/
  640  ls -ll
  641  kubectl apply -f nginx-app.yaml
  642  kubectl delete -f nginx-app.yaml
  643  kubectl apply -f nginx-app.yaml
  644  kubectl delete -f nginx-app.yaml
  645  kubectl apply -f nginx-app.yaml
  646  kubectl delete -f nginx-app.yaml
  647  kubectl apply -f nginx-app.yaml
  648  wget https://github.com/cert-manager/cert-manager/releases/download/v1.9.1/cert-manager.yaml
  649  kubectl apply -f cert-manager.yaml
  650  wget https://github.com/actions-runner-controller/actions-runner-controller/releases/download/v0.25.2/actions-runner-controller.yaml
  651  kubectl create -f https://github.com/actions-runner-controller/actions-runner-controller/releases/download/v0.25.2/actions-runner-controller.yaml
  652  kubectl create secret generic controller-manager     -n actions-runner-system     --from-literal=github_token=${ghp_Xu4zEk...2xA1DF}
  653  kubectl apply -f runnerdeployment.yaml
  654  kubectl get secrets
  655  kubectl create secret generic controller-manager     -n actions-runner-system     --from-literal=github_token='ghp_Xu4zEk...2xA1DF'
  656  kubectl delete secret controller-manager
  657  kubectl describe secrets/controller-manager
  658  kubectl create secret generic controller-manager     -n actions-runner-system     --from-literal=github_token='ghp_Xu4zEk...2xA1DF'
  659  kubectl get secrets
  660  kubectl get secrets/action-runner-system
  661  kubectl get secrets -n action-runner-system
  662  kubectl get secrets controller-manager  -n action-runner-system
  663  kubectl create secret generic controller-manager     -n actions-runner-system     --from-literal=github_token='ghp_Xu4zEk...2xA1DF'
  664  kubectl apply -f runnerdeployment.yaml
  665  history
```