# 19. Jenkins. Start

## install plugins: Ansible, slack notification

![plugins](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/19.Jenkins.Start/plugins.png)

## add restricted user to view Jobs, without any changes inside Jobs and Jenkins settings

![user credentials](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/19.Jenkins.Start/users.png)

## Hide Jenkins behind the web server (Nginx, Apache)

### Use nginx helm chart from bitnami

```
helm install nginx  oci://registry-1.docker.io/bitnamicharts/nginx --values nginx_values.yaml 

```

## Create job to run each day and collect data and send as artefacts to the slack:

### Check if today holiday in Belarus

![is_holiday](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/19.Jenkins.Start/is_holiday.png)

### Inform about exchange rates for current day (please find any). Can be included in one file-artefacts or simple message in slack

![slack_rates](https://github.com/NataliaBelogolovaya/sa.it-academy.by/blob/md-sa2-27-24/Natalia_Myslivets/19.Jenkins.Start/slack_rates.png)








