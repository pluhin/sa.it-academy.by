
```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: k6-config
data:
  k6-script.js: |
    import { Trend } from 'k6/metrics';
    import http from 'k6/http';
    import { check, sleep } from 'k6';

    let myTrend = new Trend('my_trend');

    export let options = {
        stages: [
            { duration: '30s', target: 20 },
            { duration: '1m', target: 20 },
            { duration: '10s', target: 0 },
        ],
        thresholds: {
            'http_req_duration': ['p(95)<500'], // 95% of requests must complete below 500ms
            'my_trend': ['avg<200'], // Custom threshold for the custom metric
        },
    };

    export default function () {
        let res = http.get('https://test.k6.io');
        check(res, {
            'status is 200': (r) => r.status === 200,
        });
        myTrend.add(res.timings.duration);
        sleep(1);
    }
---
apiVersion: v1
kind: Pod
metadata:
  name: k6-load-test
spec:
  containers:
  - name: k6
    image: loadimpact/k6
    command: ["k6", "run", "/mnt/k6-config/k6-script.js"]
    volumeMounts:
      - name: k6-config-volume
        mountPath: "/mnt/k6-config"
  volumes:
    - name: k6-config-volume
      configMap:
        name: k6-config

```

Case 2

```yaml



---
apiVersion: v1
kind: ConfigMap
metadata:
  name: k6-config-2
data:
  k6-script.js: |
    import http from 'k6/http';
    import { sleep } from 'k6';

    export const options = {
      vus: 1,
      duration: '5s',
    }
    export default function () {
      http.get('http://your.service');
      sleep(1);
    }
---
apiVersion: v1
kind: Pod
metadata:
  name: k6-load-test-2
spec:
  containers:
  - name: k6
    image: loadimpact/k6
    command: ["k6", "run", "/mnt/k6-config/k6-script.js"]
    volumeMounts:
      - name: k6-config-volume
        mountPath: "/mnt/k6-config"
  volumes:
    - name: k6-config-volume
      configMap:
        name: k6-config-2
```

```bash
 996  sudo pip3 install ansible-lint
  997  clear
  998  ansible-lint mysql.yaml
  999  cd ../15.K8s.ArgoCD/
 1000  history | grep tar
 1001  sudo tar -C /usr/local/bin/ -xzf https://github.com/yannh/kubeconform/releases/download/v0.6.7/kubeconform-linux-amd64.tar.gz
 1002  wgt
 1003  wget https://github.com/yannh/kubeconform/releases/download/v0.6.7/kubeconform-linux-amd64.tar.gz
 1004  ld
 1005  ls
 1006  ls -l
 1007  sudo tar -C /usr/local/bin/ -xzf kubeconform-linux-amd64.tar.gz
 1008  kubeconform
 1009  kubeconform  --summary monitoring/
 1010  kubeconform --summary -schema-location https://raw.githubusercontent.com/fluxcd-community/flux2-schemas/main/_definitions.json monitoring/
 1011  kubeconform --schema-location default --schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' ./
 1012  kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' argo-c
 1013* kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' monitoring
 1014  kubeconform --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' monitoring
 1015  kubeconform -schema-location default --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' monitoring
 1016  vim monitoring/node-exporter.yaml
 1017  kubeconform -schema-location default --summary -schema-location 'https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json' monitoring
 1018  wget https://github.com/stackrox/kube-linter/releases/download/v0.7.1/kube-linter-linux
 1019  ls -l
 1020  head kube-linter-linux
 1021  chmod +x kube-linter-linux
 1022  kube-linter-linux
 1023  sudo mv kube-linter-linux /usr/local/bin/
 1024  kube-linter-linux
 1025  kube-linter-linux lint monitoring/zabbix.yaml
 1026  kube-linter-linux lint monitoring/zabbix.yaml --add-all-built-in
 1027  vim k8s.yaml
 1028  kubectl apply -f k8s.yaml
 1029  vim k8s.yaml
 1030  kubectl delete -f k8s.yaml
 1031  vim k8s.yaml
 1032  kubectl apply -f k8s.yaml
 1033  k9s
 1034  k9s --headless
 1035  history

```