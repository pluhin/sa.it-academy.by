# Homework Assignment 1 — Deploy and setup Prometheus Alertmanager

## Steps Completed
1. Deployed Prometheus in the `monitoring` namespace with Service and Ingress.
2. Installed Alertmanager with Slack integration:
   - Slack webhook stored securely as a **SealedSecret** (`alertmanager-slack-sealed.yaml`).
   - Configured Alertmanager via `alertmanager-config.yaml`, deployed with `alertmanager-deployment.yaml` and exposed with `alertmanager-service.yaml`.
3. Added alerting rules:
   - Extended the existing `prometheus-server-conf.yaml` ConfigMap by inserting new rule for **CPU overload**:
	  ```YAML
	   - name: pod-cpu-alerts
	      rules:
	      - alert: HighPodCPUUsage
	        expr: sum by (namespace, pod) (               rate(container_cpu_usage_seconds_total{container!="",container!="POD"}[2m])) > 0.5
	        for: 2m
	        labels:
	          severity: slack
	        annotations:
	          summary: "CPU overload on pod {{ $labels.pod }}"
	          description: "Pod {{ $labels.pod }} in {{ $labels.namespace }} has CPU usage > 0.5 core for 2m."
	  ```
   
1. Tested alerts:
   - Emulated CPU load with:
     ```bash
     kubectl run cpu-stress --image=busybox --namespace=monitoring -- \
       sh -c "while true; do :; done"
     ```
   - Verified alerts in Prometheus UI and received notifications in Slack.
## Files
- `alertmanager-config.yaml` — Alertmanager configuration with Slack receiver.
- `alertmanager-deployment.yaml` — Deployment for Alertmanager.
- `alertmanager-service.yaml` — Service for Alertmanager.
- `alertmanager-slack-sealed.yaml` — SealedSecret with Slack webhook.

## Screenshots
- Prometheus UI showing active alerts - `prometheus-alert.png`
- Slack channel `#devops-alerts` with Alertmanager notification - `slack-alert.png`

# Homework Assignment 2: Use Grafana to display load of pods

## Steps Completed
1. Deployed Grafana in the `monitoring` namespace (`grafana-deployment.yaml`).
2. Added Prometheus as a data source (`http://prometheus-service.monitoring.svc:8080`).
3. Created a dashboard with four panels:
   - CPU usage per pod
   - Memory usage per pod
   - Total CPU usage per node
   - Total Memory usage per node
4. Verified that metrics are displayed correctly and captured a screenshot of the dashboard.

## Files
- `grafana-deployment.yaml` — Deployment, Service, and Ingress for Grafana.

## Screenshots
- Grafana dashboard with CPU and memory graphs — `grafana.png`