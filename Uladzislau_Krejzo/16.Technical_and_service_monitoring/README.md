# 16. Technical and service monitoring

## Deploy Prometheus + Alert manager

### History of commands
```
mkdir 16.Monitoring
cd 16.Monitoring
kubectl create namespace monitoring
vim prometeus.yaml
kubectl apply -f prometeus.yaml
vim alertmanager.yaml
kubectl apply -f alertmanager.yaml
vim grafana.yaml
kubectl apply -f grafana.yaml
```
### Prometheus

[prometeus.yaml](prometeus.yaml)

### Alert manager
[alertmanager.yaml](alertmanager.yaml)

### Grafana

[grafana.yaml](grafana.yaml)

[Grafana template](template.json)

## Screenshots

### Prometeus
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/16.Technical_and_service_monitoring/prometeus.png)

### Alert manager
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/16.Technical_and_service_monitoring/alertmanager.png)

### Slack notification
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/16.Technical_and_service_monitoring/slack.png)

### Grafana
![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/16.Technical_and_service_monitoring/grafana1.png)

![Alt text](https://github.com/jankalep/sa.it-academy.by/blob/master/Uladzislau_Krejzo/16.Technical_and_service_monitoring/grafana2.png)