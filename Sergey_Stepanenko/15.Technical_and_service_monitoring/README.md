## Technical and service monitoring

### Alert from prometheus
```bash
       - alert: Pod CPU Usage
         expr: (sum(rate(container_cpu_usage_seconds_total{pod!=""}[3m])) by (instance, pod) * 100) > 80
         for: 1m
         labels:
           severity: warning
         annotations:
          summary: Pod CPU usage (instance {{ $labels.instance }})
          description: "Pod CPU usage is above 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"  
```

### Slack integration from alertmanager
```bash
    data:
    config.yml:
        global:
        templates:
        - '/etc/alertmanager/*.tmpl'
        route:
        receiver: slack_demo
        group_by: ['alertname', 'priority']
        group_wait: 10s
        repeat_interval: 1m
    
        receivers:
        - name: slack_demo
        slack_configs:
        - api_url: https://hooks.slack.com/services/T......
            channel: '#notifications'
            text: "<!channel> \nsummary: {{ .CommonAnnotations.summary }}\ndescription: {{ .CommonAnnotations.description }}"
```

### Screenshots
### Prometheus
![Screenshot_4](https://user-images.githubusercontent.com/49452234/190912475-ed322a3f-99ae-4e10-a0a1-f06438d90778.jpg)

### Grafana dashboard
![grafana](https://user-images.githubusercontent.com/49452234/190913609-388b8f16-c7a4-40b7-b32f-76d94fec1f49.jpg)

### Slack notification
![slack](https://user-images.githubusercontent.com/49452234/190912284-297382f2-581f-4aa7-bf1c-bf5ae11325af.jpg)
