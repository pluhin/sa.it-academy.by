# 16. Technical and service monitoring
## Homework Assignment 1: Deploy and setup Prometheus Alertmanager
1. Create prometheus.yml, ksm.yaml, node-exporter.yaml
2. Put the files in ArgoCD repo and sync main app in Argo UI. -> Deployment is started.  
Result:  
https://drive.google.com/file/d/1mLt7kbqrviXy3ppWFNGgdvnXXLGDt-O2/view?usp=sharing 
https://drive.google.com/file/d/18KkHR5pOvLb3GEq0QqqPmyYHQtG8P605/view?usp=sharing  
3. Create alertmanager.yaml and add SLACK WEBHOOK URL. Then run following commands:
```bash
debian@vbox ~/i/1/argo-apps (master)> kubectl create secret generic alertmanager-config \                                                                                                                
                                            --from-file=alertmanager.yaml=./alertmanager.yaml -n monitoring --dry-run=client -o yaml | kubectl apply -f -

secret/alertmanager-config configured
``` 
4. Create alertmanager-deployment.yaml; alertmanager-service.yaml. Add to argo-apps repo. Sync main.   
Result: alertmaanger container is created.  
https://drive.google.com/file/d/1cZb6UXuooBUwWAEQ9-7q6JVRQm7gT-GZ/view?usp=sharing  
5. Alerd msg was recieved.  
Result:  
https://drive.google.com/file/d/1Y_IiSdZ-q2leMU4pgSZSuVsI261aAYGE/view?usp=sharing

## Homework Assignment 2: Use Grafana to display load of pods
1. Create grafana.yaml and add to ArgoCD app. Sync.
2. Add prometeus as metric source and create dashboard.
- CPU 
```bash
sum(rate(container_cpu_usage_seconds_total{container!="", pod!=""}[2m])) by (pod)
```
- Mem
```bash
sum(container_memory_usage_bytes{container!="", pod!=""}) by (pod)
```
Result:  
https://drive.google.com/file/d/1JFHxcTYSOKWDvmBSCI4S89qVAPLAa553/view?usp=sharing
