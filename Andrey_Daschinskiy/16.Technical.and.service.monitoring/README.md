#### 16. Technical and service monitoring

* Create files:
-prometheus.yml
-alerts.yml
-alertmanager.yml
-docker-compose.yml

* Launching services
```bash
docker-compose up -d
```
* Made a port forwarding
```bash
ssh -L 9090:192.168.208.7:9090 -L 9093:192.168.208.7:9093 -L 3000:192.168.208.7:3000 -J jump_sa@178.124.206.53:32510 root@192.168.208.7
```
* Load Emulation
```bash
apt install -y stress-ng
stress-ng --cpu 8 --timeout 300s
```
* Results:
[Screenshot_1](https://drive.google.com/file/d/12KfLuELapCdx3uRoiJuxFbQKXU_zxOK5/view?usp=sharing "Screenshot_1")
[Screenshot_2](https://drive.google.com/file/d/1YOOgXOD05cuXt_XT9x3zVGrKoHbfavYX/view?usp=sharing "Screenshot_2")
[Screenshot_3](https://drive.google.com/file/d/1rhgl2yx6JSwFZhz1n5A2jzPWJzYLNE8m/view?usp=sharing "Screenshot_3")
[Screenshot_4](https://drive.google.com/file/d/1c2z5OOA0uIAvXEoZZwR4i5etGYEFiK52/view?usp=sharing "Screenshot_4")
[Screenshot_5](https://drive.google.com/file/d/1hd0pIjteVNbiNb4Pt27CcLyWWVVtDnWS/view?usp=sharing "Screenshot_5")
