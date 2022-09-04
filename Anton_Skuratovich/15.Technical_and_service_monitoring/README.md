# Technical and service monitoring
##

### Alert from prometheus configmap
```yaml
       - alert: Pod CPU Usage
         expr: (sum(rate(container_cpu_usage_seconds_total{pod!=""}[3m])) by (instance, pod) * 100) > 80
         for: 1m
         labels:
           severity: warning
         annotations:
          summary: Pod CPU usage (instance {{ $labels.instance }})
          description: "Pod CPU usage is above 80%\n  VALUE = {{ $value }}\n  LABELS = {{ $labels }}"  
```
### Slack integration from alertmanager configmap 
```yaml
    data:
    config.yml: |-
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
## Screenshots 
### Prometheus web UI
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mtjaXkSTrlPf04Uqi0alvLpmSdoNoZlWRQvvqHQe1wXTN0ykoKsUtXEPCYG9XmKEQGWu39ruYhfA-Y6CwXjlpgOcsaReD_ldOToBgzQ28_0GxSmS0DccYMOMdrxYu5Fy1V1L7KpwManQgUe0OkTlkNEgyAkaQbPeGC9Nu5JshMPHkD6MajPr0r63BVibqhbEn?width=2359&height=1602&cropmode=none" width="auto" height="auto" />
</dv>

### Grafana dashboard
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mMAo3L_updMcxXOKXbQsQ3UehT6LHvFgdXNCBaQywfgydTj-RqVeo4Xy85ZgJTsBz28n1PA6fKz-FlhfmHisfkErVYokTfT514G13YPdjUpJYLwhE4qbDC2m7v06UvDpy7V7-cTRZ7DTjJU-_wJsETUtYhrLJzYyBH10TJTqUJkCNtUEAg1A0AijRYtGazqOm?width=2365&height=1749&cropmode=none" width="auto" height="auto" />
</dv>

### Slack notification (I used 20% threshold for test)
<dv>
<img src="https://dub01pap001files.storage.live.com/y4mfpWhCZq0SFgsiNLsBb7noKV6dnIwunpN9Z0K41tY5wLKDrhUgEFXRyWpNy_oCC07Bf1cWCsc-2z_zwyF_1aUCslJ5UQm_7IWubH2kgxkiRglBzoF_b3CIdGF1rr5mmWY6EOzDcmhKT9btnGlHAZ3ReuuRC3yqb2pyODBJSVzHhcVoVLjczqPdoKxCqYmniFt?width=2281&height=1465&cropmode=none" width="auto" height="auto" />
</dv>