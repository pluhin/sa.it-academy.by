*  1: Automate Docker images test by github action
* deploy docker image for test
* test by requesting data from image
* test if image has not root access inside
-------

# Deploy docker image wirh simple web that retirn UUID

``` yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: runner-smoke-app
  namespace: githubrunner
data:
  server.py: |
    import http.server
    import os
    import socketserver

    class H(http.server.BaseHTTPRequestHandler):
        def log_message(self, *args):
            pass

        def do_GET(self):
            uid = os.geteuid()
            body = f"runner-smoke-ok uid={uid}\n".encode()
            self.send_response(200)
            self.send_header("Content-Type", "text/plain; charset=utf-8")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

    with socketserver.TCPServer(("", 8080), H) as httpd:
        httpd.serve_forever()

---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: runner-smoke
  namespace: githubrunner
  labels:
    app: runner-smoke
spec:
  replicas: 1
  selector:
    matchLabels:
      app: runner-smoke
  template:
    metadata:
      labels:
        app: runner-smoke
    spec:
      securityContext:
        runAsNonRoot: true
        runAsUser: 65534
      containers:
      - name: app
        image: python:3.12-alpine
        command: ["python", "/app/server.py"]
        ports:
        - containerPort: 8080
        volumeMounts:
        - name: app
          mountPath: /app
          readOnly: true
        resources:
          requests:
            cpu: 10m
            memory: 64Mi
          limits:
            cpu: 200m
            memory: 128Mi
      volumes:
      - name: app
        configMap:
          name: runner-smoke-app
          defaultMode: 0444

---
apiVersion: v1
kind: Service
metadata:
  name: runner-smoke
  namespace: githubrunner
spec:
  type: ClusterIP
  selector:
    app: runner-smoke
  ports:
  - port: 80
    targetPort: 8080


```

# WorkFlow 4 GithubRunner (staret at prev Lessons) 

 
 [result_githubrunner](1_Test_Deocker.png)


runner-smoke-http.yml
``` yaml
name: Runner namespace smoke HTTP

on:
  push:
    branches: [main, master]
  workflow_dispatch:

jobs:
  smoke:
    runs-on: self-hosted
    steps:
      - name: Curl runner-smoke + uid не root
        env:
          SMOKE_URL: http://runner-smoke.githubrunner.svc.cluster.local
        run: |
          set -euo pipefail
          body=$(curl -sfS --max-time 15 "$SMOKE_URL/")
          echo "$body" | grep -q 'runner-smoke-ok'
          # uid=0 не допускаем; uid>=1 (например 65534 nobody)
          echo "$body" | grep -qE 'uid=[1-9][0-9]*'

```





# Assigment 2

start on push or create PR to manifests repository
all tools are inside container/pods
integrate notification about status of validation


* kubeconform.yml  in guithub

``` yaml
name: Validate Kubernetes manifests (kubeconform)

on:
  push:
    paths:
      - "manifests/**"
      - ".github/workflows/kubeconform.yml"
  pull_request:
    paths:
      - "manifests/**"
      - ".github/workflows/kubeconform.yml"
  workflow_dispatch:

jobs:
  kubeconform:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - name: kubeconform (Docker)
        id: kubeconform
        run: |
          set -euo pipefail
          docker run --rm \
            -v "${{ github.workspace }}:/work" \
            -w /work \
            ghcr.io/yannh/kubeconform:latest \
            -kubernetes-version 1.30.0 \
            -summary \
            -strict \
            manifests/

      - name: Summary в GitHub Actions
        if: always()
        run: |
          {
            echo "## Kubeconform"
            if [ "${{ steps.kubeconform.outcome }}" = "success" ]; then
              echo "Статус: **успех**"
            else
              echo "Статус: **ошибка** — см. лог шага kubeconform"
            fi
            echo ""
            echo "Run: ${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}"
          } >> "$GITHUB_STEP_SUMMARY"

      - name: Slack
        if: always()
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK_URL }}
        run: |
          [ -n "${SLACK_WEBHOOK:-}" ] || exit 0
          if [ "${{ steps.kubeconform.outcome }}" = "success" ]; then STATUS="succeeded"; else STATUS="failed"; fi
          payload=$(printf '{"text":"Kubeconform %s | %s | branch/ref: %s"}' "$STATUS" "${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}" "${{ github.ref_name }}")
          curl -sS -X POST -H 'Content-type: application/json' --data "$payload" "$SLACK_WEBHOOK"


```


Result in Attacments (after change config in manifests and push)


[result_githubrunner2](Runner_1.png)
[result_githubrunner2](Runner_1.png)