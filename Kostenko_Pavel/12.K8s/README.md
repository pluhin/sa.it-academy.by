### 12.K8s


## dep.yaml
```bash
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: test-config
data:
  index.php: |
    <?php
    $hostname = gethostname();
    echo "<h1>Hello from {$hostname}</h1>";
    ?>
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webserver
  labels:
    app: simple-web
spec:
  replicas: 1
  strategy:
    type: RollingUpdate
    rollingUpdate:
      maxSurge: "100%"
      maxUnavailable: "0%"
  selector:
    matchLabels:
      app: simple-web
  template:
    metadata:
      labels:
        app: simple-web
    spec:
      containers:
      - name: php-container
        image: eboraas/apache-php
        ports:
        - containerPort: 80
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
          limits:
            cpu: 200m
            memory: 100Mi    
        volumeMounts:
        - name: php-container
          mountPath: /var/www/html
        - name: ssh-keys-v
          mountPath: "/root/.ssh"          
      volumes:
      - name: php-container
        configMap:
          name: test-config
      - name: ssh-keys-v
        secret:
          secretName: ssh-keys-v
          defaultMode: 0600 
---
apiVersion: v1
kind: Service
metadata:
  name: simple-web
  labels:
    run: simple-web
spec:
  ports:
  - port: 80
    protocol: TCP
  selector:
    app: simple-web
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: ingress-sa
  annotations:
    kubernetes.io/ingress.class: php-container
spec:
  rules:
    - host: namepods.k8s-12.sa
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: simple-web
                port:
                  number: 80
```
## Screen from browser (hostname pod)
---
![namepod](namepod.png)
---



## Secret.yaml (keys in b64)
```bash
---
apiVersion: v1
kind: Secret
metadata:
  name: ssh-keys-v
type: Opaque
data:
    id_rsa: LS0tLS1CRUdJTiBPUEVOU1NIIFBSSVZBVEUgS0VZLS0tLS0KYjNCbGJuTnphQzFyWlhrdGRqRUFBQUFBQkc1dmJtVUFBQUFFYm05dVpRQUFBQUFBQUFBQkFBQUJsd0FBQUFkemMyZ3RjbgpOaEFBQUFBd0VBQVFBQUFZRUE2b1lRL2VpUlpUN0MyZ2dTU1J2V0l0bm01R210aGNQek5TWWZoVko2K2I3VlNqb01TcHZHCnVNOWZNY3FSb09mWG12MVFMbmU2RHg5Z2EzTEZJL29iSG5IRlplNTdCWGo4Tm5LcjN0b2tRMGFtS0REWkJIVnJ5eVlwQzUKYU5Sa01SdlFTWWVDSzdheUNLTVF0UER3ZFVydkV0SGpJeHFsVTRjQkdRRnNkd1FRMXIrVmk2bC9sbHpGeG1SdVp0U3NmYQpPRGJJcWdNTTdKMit6bTVRM3I3MjQ5UkgxMU1qZlpQZ05TWFhkQWFUenNNWTVMdFM1c1ZGZUdteEdNL1RNeW1VTEhYWU9kClpsS0p3WUV2bk1TZHUxVVBsMVNiSkoweWEzbTB2ZFBuTHRaZGRqMW4xT0o5ZWRackIzTTBTRzNSMWtsM3c3aG1ON011NFIKWjNoLy96UjJJcFlTOXpWbGZqbTBIN2U5MmhLNzNEa2hEMElWbzJyc2N6Z0ZlNUN5am15aFNBR2ZVM2xFSGVYRWRmeC84UgpEbnd0bGVzNlBlQU9NdXJXN2d4b0E1Tnc1ZGRCNDNqamxYMHIxeWQxUWNybkdCWHRQTkVBRUJvaWZXYXFsV1JiampaeWJXCkRjYWhuZlA1WGtUd1RIS2lKQVNzcVowYVlJbFgzZjZ5eGRSWVpBbGhBQUFGaU9iME9Tdm05RGtyQUFBQUIzTnphQzF5YzIKRUFBQUdCQU9xR0VQM29rV1Urd3RvSUVra2IxaUxaNXVScHJZWEQ4elVtSDRWU2V2bSsxVW82REVxYnhyalBYekhLa2FEbgoxNXI5VUM1M3VnOGZZR3R5eFNQNkd4NXh4V1h1ZXdWNC9EWnlxOTdhSkVOR3BpZ3cyUVIxYThzbUtRdVdqVVpERWIwRW1ICmdpdTJzZ2lqRUxUdzhIVks3eExSNHlNYXBWT0hBUmtCYkhjRUVOYS9sWXVwZjVaY3hjWmtibWJVckgyamcyeUtvRERPeWQKdnM1dVVONis5dVBVUjlkVEkzMlQ0RFVsMTNRR2s4N0RHT1M3VXViRlJYaHBzUmpQMHpNcGxDeDEyRG5XWlNpY0dCTDV6RQpuYnRWRDVkVW15U2RNbXQ1dEwzVDV5N1dYWFk5WjlUaWZYbldhd2R6TkVodDBkWkpkOE80Wmplekx1RVdkNGYvODBkaUtXCkV2YzFaWDQ1dEIrM3Zkb1N1OXc1SVE5Q0ZhTnE3SE00Qlh1UXNvNXNvVWdCbjFONVJCM2x4SFg4Zi9FUTU4TFpYck9qM2cKRGpMcTF1NE1hQU9UY09YWFFlTjQ0NVY5SzljbmRVSEs1eGdWN1R6UkFCQWFJbjFtcXBWa1c0NDJjbTFnM0dvWjN6K1Y1RQo4RXh5b2lRRXJLbWRHbUNKVjkzK3NzWFVXR1FKWVFBQUFBTUJBQUVBQUFHQVpHdHZqeWtzU0t2dEJ5cjVtWEJmNnFCZksyCkxNdUVCRlBYYkxmR3pxMTFHTlJyRkFYaG9CcDFTME1EL0t4NWsrU3RFNHFneitFRWVoSTZFTEpQS005aVpGSGZaVm11eEoKSW85TFpLc0haLzh5V25kQUZaYXB4MXpacW1xV3A0VkViU2t3bUJCWEsvSE0rbDhiUlJZZ2ZxQXFiNG1TbHByVEJibWZkdwpHQzRYZjd5ZExpWXZ5WlNENHdWUitKb01HZWdQK0VRTGY1cXIrSTJoK0daVHBqd1A0K25NYXVwYkRTQ2kvZjU0Q0JmY0V3ClFaQ3NXTUFUbFJHOGtTRThEK1kzQ0ZFWVZvZit0bllBZW1qOEtza2xPZFI3NHRRZzJMMlFJZHF6VmVWcWl5Y083OFlraEoKNVBSNU1iNXZFbkhwL2VEVWx6Z2djSzBXTEhRUDJKcUhIODFjbFVUTWFBelFIOHlyS3Y0UDRkVFF0ZXBXb0JGU1ZTTlNsagpyK0Vxem1DYlovK2wzZTY4eGVvcTZDWFJ3S085UFZkbU5PSEhBWThPcW5PWDNqekhNdXJ3bkhWSXlaME9MMDlEcEZJZEcwCkk3clVpWnpZZkZtaE5KTFRydmIwOFBSVVlETDR3UFVPU2pLTWpaaDU2MG8yK0p2THQyZFVkYStwMXZHV2RVYkVKNUFBQUEKd0dUZktlUGR2SHU0KzZ3cm1RZDZ0WXozQlZQK2pCaUZyYXNjcXVGaUlZcHRzemV4dXRUZU9KNHFuQXNWd0xoemhFSlI1MwpIamk2SU5XNTJzK1JMSXMzampCcWRjS1cyc3MvS1RtK25hWHNybVo3aHBKZHU3dHlpYitpdWhlQU53VkI4RXFkV3dKRS82CmwySFpBcUVGZmFlUElkN29tWTdyc0VnekRIOHZIMSt0UTdWTzZWekJRRTFRRDhsYXN3SkVpQkh3cVZDVy9CanhtbVZ6KzgKSm5LdWE0ckdqRThnL0lTMU5VbDlpSThZUUp6VEpNZERwckJVVXU0SkgvS3pHTnF3QUFBTUVBOTdtSGpDS0wxUWNuemxmdgo3SHJabmZuNlU0N2tYcnMwTEo2b0JBVyt5a2FDOXFUa2RuMjMzSXlYNkJuc3huL2M2ZklUK1B3cnd0bGV3Y0dOZkFqeFRRCm02Y1BvTWQyNGdvVjBET1VzSEdJSlBycWh4Zmc0ellKUlAvems1azRJOVpmWUdwcUN6ZzNCRUcrVVdJVHRubWx0ZUdrLzAKSE1NZ2pJMzYvWDJ4NFB1eUlCb2twUEladWMxMmdQeFlCMWdnZWdTWXJMY3Z0TnAzNVlpVFpzUUl1ckxJQkl3d2M2RXBPSAp0cWtqYVJGVHc2aFp4QUxQaERFcTNRQndiTHhsMjNBQUFBd1FEeVc2VS92Q2hPYVc3akJsVWRSVVZzQWhMZzA5NHh2M08vCkppbmJIOVlPMSt6RFEydEJRenlrejZ6Rm1lRW41eVRIR3hzMGZUY1lPN3lxaGpDZW5UcnhWWmRBTXZERysvSkE1QVVOdVIKSVkwb2tMdDQ4WlBsNWU5cHVlMnFIRE44NllKR1NiWEliYXVvaTk3RlpKQVhrUnNxNUJXVm9ORmRxZ1d5eStKZVNwN1ZmNAppT3pGTlcvZUIwR3VjTGI1ZHVubSttR2lrU1ljdTJDRnRmY2Zqd0RwckVPekZLOURnS0JucHhjeGJkc1JqZjdUNmVnNXJqCndob1hwV2h1eGFVYWNBQUFBUFlXUnRiRzlqUUhWaWRXNTBkVEl3QVFJREJBPT0KLS0tLS1FTkQgT1BFTlNTSCBQUklWQVRFIEtFWS0tLS0t
    id_rsa.pub: c3NoLXJzYSBBQUFBQjNOemFDMXljMkVBQUFBREFRQUJBQUFCZ1FEcWhoRDk2SkZsUHNMYUNCSkpHOVlpMmVia2FhMkZ3L00xSmgrRlVucjV2dFZLT2d4S204YTR6MTh4eXBHZzU5ZWEvVkF1ZDdvUEgyQnJjc1VqK2hzZWNjVmw3bnNGZVB3MmNxdmUyaVJEUnFZb01Oa0VkV3ZMSmlrTGxvMUdReEc5QkpoNElydHJJSW94QzA4UEIxU3U4UzBlTWpHcVZUaHdFWkFXeDNCQkRXdjVXTHFYK1dYTVhHWkc1bTFLeDlvNE5zaXFBd3pzbmI3T2JsRGV2dmJqMUVmWFV5TjlrK0ExSmRkMEJwUE93eGprdTFMbXhVVjRhYkVZejlNektaUXNkZGc1MW1Vb25CZ1MrY3hKMjdWUStYVkpza25USnJlYlM5MCtjdTFsMTJQV2ZVNG4xNTFtc0hjelJJYmRIV1NYZkR1R1kzc3k3aEZuZUgvL05IWWlsaEwzTldWK09iUWZ0NzNhRXJ2Y09TRVBRaFdqYXV4ek9BVjdrTEtPYktGSUFaOVRlVVFkNWNSMS9IL3hFT2ZDMlY2em85NEE0eTZ0YnVER2dEazNEbDEwSGplT09WZlN2WEozVkJ5dWNZRmUwODBRQVFHaUo5WnFxVlpGdU9Obkp0WU54cUdkOC9sZVJQQk1jcUlrQkt5cG5ScGdpVmZkL3JMRjFGaGtDV0U9IGFkbWxvY0B1YnVudHUyMA==

```

## Gerenerate sealed_secret.yaml and apply in k8s
```bash
cat secret.yaml | kubeseal --format yaml > sealed_secret.yaml
kubectl apply -f sealed_secret.yaml
```

---
![sealed_in_k9s](sealed_in_k9s.png.png)
---

---
![12_sshfolder](12_sshfolder.png)
---

---
![cat_id_rsa](cat_id_rsa.png)
---

