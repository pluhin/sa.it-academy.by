# HA1: Config maps and secrets

## DEPLOYMENT.YAML

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: web-test
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-index
  namespace: web-test
data:
  dummy: "placeholder"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deploy
  namespace: web-test
spec:
  replicas: 4
  selector:
    matchLabels:
      app: nginx-test
  template:
    metadata:
      labels:
        app: nginx-test
    spec:
      volumes:
        - name: web-root
          emptyDir: {}
        - name: ssh-keys
          secret:
            secretName: nginx-ssh-secret
            defaultMode: 0600
      initContainers:
        - name: init-index
          image: busybox:1.36
          command:
            - sh
            - -c
            - |
              set -eu
              HOST="$(hostname)"
              echo "<!doctype html><html><head><meta charset='utf-8'><title>${HOST}</title></head><body><h1>${HOST}</h1></body></html>" > /workdir/index.html
	  volumeMounts:
            - name: web-root
              mountPath: /workdir
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
          volumeMounts:
            - name: web-root
              mountPath: /usr/share/nginx/html
            - name: ssh-keys
              mountPath: /root/.ssh
              readOnly: true
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-test-svc
  namespace: web-test
spec:
  selector:
    app: nginx-test
  type: NodePort
  ports:
    - name: http
      port: 80
      targetPort: 80
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-test-ingress
  namespace: web-test
spec:
  rules:
    - host: nginx-test.k8s-5.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-test-svc
                port:
                  number: 80
```

## SSH-KEYS-SEALED.YAML
 
```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: nginx-ssh-secret
  namespace: web-test
spec:
  encryptedData:
    id_rsa: AgAIq3TYTtyzGvJ7hUcgZHvaNVYvn5N9ji4AkSos6YmwKsLYof4Ewc9lB+1L/IEivDinG66ILJYg71MLg0MICKnE5slaQSaMQweS1QnS/gmH2JO9/E9r1yX+XxwRfR49o1A/7ZWS+vg5t5ygmpAolE9DCFX7HpKr97MP9TRAQANcfo05>
    id_rsa.pub: AgCZiifSaplUinSvZSyn3i2hTvhbWT4+qM4tzanyE6Zt44v/mPbCRU0A6SH5q7uBW1YIYn9nq/jFbHI4ptRmL7xmy/jFLZ7iQZkr/E1QMueT0+ZMHo6Czo9bxhafm1cZ3BlrazTS6XN0py6oWbDADqD1b7qDkElxsDm4jr5Nrer2>
  template:
    metadata:
      creationTimestamp: null
      name: nginx-ssh-secret
      namespace: web-test
```

## Print-screen curl

![Curl pods](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/12.K8s.Data.Security/curl_pods.png)

## Print-screen check keys (for example)

![SSH](https://github.com/MakTruue/sa.it-academy.by/blob/md-sa2-32-25/Ruslan_Makarevich/12.K8s.Data.Security/ssh_key.png)


