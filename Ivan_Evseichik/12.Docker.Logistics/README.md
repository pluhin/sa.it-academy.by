### 12. Docker. Logistics
--------------------
##### Automate create image and push to docker hub
- Create [Jenkinsfile](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/Jenkinsfile)
- My [Dockerfile](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/Dockerfile), my [config](https://github.com/ifanui/sa.it-academy.by/tree/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/config) for consul service and [files](https://github.com/ifanui/sa.it-academy.by/tree/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/src) for start consul service.
- My output from Jenkins pipeline job:
> Jenkins
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/images/jenkins_log.png)
- My log from job [pipeline.log](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/pipeline.log)
- After pushing image, show image from Docker Hub:
> Image
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/images/docker_hub.png)

##### Create docker compose file which contains the some applications
- My config for nginx server [here](https://github.com/ifanui/sa.it-academy.by/tree/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/docker-compose/devops.by)
- My [docker-compose.yml](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/docker-compose/docker-compose.yml)
- My web server:
> Web:
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/images/web.png)
- My sonarr site:
>Sonarr
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/images/sanarr.png)
- My radarr site:
>Radarr
![](https://github.com/ifanui/sa.it-academy.by/blob/m-sa2-06-19/Ivan_Evseichik/12.Docker.Logistics/images/radarr.png)

