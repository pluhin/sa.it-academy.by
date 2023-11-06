# 12. Kubernetes. Data. Security

## Updated manifest appl.yaml

```yaml
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-config
data:
  index.html: |
    <!DOCTYPE html><html><body>
    <h3>Nginx container</h3>
    <h1>_HOSTNAME_</h1>
    </body></html>

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver-nginx
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 4
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: "33%"
      maxUnavailable: "0%"
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 50m
            memory: 50Mi
          limits:
            cpu: 100m
            memory: 100Mi
        volumeMounts:
          - mountPath: /usr/share/nginx/html/
            name: index
          - mountPath: /root/.ssh/
            name: ssh

      initContainers:
      - name: test
        image: nginx:latest
        command: ["sh", "-c", 'cd /tmp/; sed -e "s/HOSTNAME/$HOSTNAME/" /tmp/index.html > /usr/share/nginx/html/index.html']
        volumeMounts:
        - name: test-config-mount
          mountPath: /tmp/index.html
          subPath: index.html
          readOnly: false
        - mountPath: /usr/share/nginx/html/
          name: index
        - mountPath: /root/.ssh/
          name: ssh-key
      volumes:
      - name: test-config-mount
        configMap:
          name: test-config
      - name: index
        emptyDir: {}
      - name: ssh
        emptyDir: {}
      - name: ssh-key
        secret:
          secretName: test-keys

---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  labels:
    run: webserver-nginx
spec:
  selector:
    app: nginx
  ports:
  - port: 80
    protocol: TCP
    targetPort: 80

---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nginx-ingress-sa
  annotations:
    kubernetes.io/ingress.class: nginx
    nginx.ingress.kubernetes.io/server-alias: "nginx.k8s-6.sa"
spec:
  rules:
    - host: nginx.k8s-6.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: nginx-service
                port:
                  number: 80

```

## Screenshots of Working pods with Hostnames

Browser

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/4Pods_working.png)

K9s

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/k9s_working_pods.png)

## Secrets

Sealed secret sealed_secret.yaml
```yaml
---
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: test-keys
  namespace: default
spec:
  encryptedData:
    id_rsa: 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
    id_rsa.pub: AgCkf3JBSCNDivW1yyD/eMVB4VMvlONO6ZlaiqX/1VyyTWoVuu+4cndfFP0xHN/j4lQX/qrGuPjr0gGO4mJMaVMB4m+I/0FSrDR71xq7xXYbQasEvJxjXhYNaZsFtxbcdMQrVTMKBRNOaXsan9HmXLhpnETjJcCK52zF7Bj86Bmwb5oEuWhjsJBmb9RhpkENQH9kbWHPfU25iG8CgbJ3CNBouBOgFG+zxeBjQdOu6SrZT1804IH2ALbXHWh8q1Limxrapkxowul+ximv8JB6fzpsA+jRRO/60GEh35JuBBxogHdDfW8Zqq6KYIMjwMOugQnWthPONPwkh4MM6GDSzsTCeXiAKnDSY6qNsRV8E96cqhegqOP2yEf74S5qCW7vLhvgeG62X7P5/0d+ENLbr5KXUnnFJvXTiO8Veyu2sDPxABfhrWXBlpEq1S3gn8orkKb2qFoTHB81EHCu9LiaohMdtaIyTdYaT5v0Ktbt51/2yEJ90Pt8baCG6uP/9W7ip56ettzZ7i1+VdSiEZGMcMjgruySqKuCZiBKaAo65S4juWYCetFAIwNZqTASei+e+uv6kjI42lUQd4PkSPEhd7Ly3pifEfYXqyjhTkqJsY5qvqyL+mPf6aRlh+NCszqt4lar6c5qidK6DccRgcZIwq87D6Cf2jCOxVQYGNrjtB2kRbfZv3STa1yhv+6xj+xShcx7x8gSFrHHITC8sVsIUGH+wjkP3ILHV3ZuFWBFdfUOV3uKMoMkMdXK0xYNz6G5S+SyoJUKq42EcsXydkXoPXJjeLtvwa6qfxAyK15wXvxyjm7Lh5BWgJwrAdILeU2CUINQ+nN0Jcug7cx+rIOQ7v6/rY+w8CIc7mSHiqbApHqEb0KT0gBV2Ef/ik74R8Yu5L3UbIEFVAnm0S3HuL9vZ0i5BertyreUbEkv8bd6Opb+ee8ogQ+YTDvM77mb8XfSnQPp1Z71ntrViaWOeAfZtX3hbj68WVUjk05jK0UK92JeTs4vhdBTvl9um+jjBgMZzVGfb1MhgyyI73DeGtyvVDBDByYBS4l7EtQ4kcuZmfsWPkX3hS+E0jT5t+XIQkZHrch3L+MHHUW/ir78isIlhSURP52LYwp3pi+tnUkVN7csLIFFSEmb6zIVN05GGO0rBSMhwJYVO0nVNIwt1CLynu9TFM9eCij4pL0VAVGlkoO7Fll7kZQkANA4YmMOkH64O8n2jSX3eWrvkvwHUA==
  template:
    metadata:
      creationTimestamp: null
      name: test-keys
      namespace: default

```

k9s sealed controller 

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/k9s_sealed-controller.png)

Ported secrets

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/11.Kubernetes.Basic_objects/ported_secrets.png)



