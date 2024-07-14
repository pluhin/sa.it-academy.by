# 1.Homework Assignment 1: Deploy and setup Prometheus Alertmanager

Для деплоя создадим отдельный namespace
```
kubectl create namespace monitoring
kubectl apply -f alertmanager.yaml -n monitoring
kubectl apply -f prometheus.yaml -n monitoring
```
Сами prometheus.yaml и alertmanager.yaml смотри в папке

Ссылка на настройку слэка с алертами: [https://docs.kubermatic.com/kubermatic/v2.25/tutorials-howtos/monitoring-logging-alerting/user-cluster/setting-up-alertmanager-with-slack-notifications/]

![image](https://github.com/user-attachments/assets/644d9107-8325-4d9d-ba91-65e3fc40f22f)

![image](https://github.com/user-attachments/assets/91b5fa3b-7f31-4676-b353-54ac6df1fed8)

![image](https://github.com/user-attachments/assets/b75e735d-f744-44c3-aaec-a380b3847e70)

>>>>>>> 6977773d3d260d919ffc90266e13c3d99007b1ef
![image](https://github.com/user-attachments/assets/dc23b324-9fd9-4a9f-adef-43816db48148)
