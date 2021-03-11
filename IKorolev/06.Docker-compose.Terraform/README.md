# 06.Docker-compose.Terraform
## Docker-compose
```
CONTAINER ID   IMAGE                COMMAND                  CREATED          STATUS          PORTS                            NAMES
787a31dd81c9   nginx                "/docker-entrypoint.…"   10 minutes ago   Up 10 minutes   80/tcp, 0.0.0.0:8098->8099/tcp   nginx
f68469260ec0   linuxserver/sonarr   "/init"                  10 minutes ago   Up 10 minutes   0.0.0.0:8989->8989/tcp           sonarr
1521b817ad30   linuxserver/radarr   "/init"                  10 minutes ago   Up 10 minutes   0.0.0.0:7878->7878/tcp           radarr
```

## Terraform

[Terraform](https://github.com/Korolev731/sa.it-academy.by/blob/md-sa2-16-21/IKorolev/06.Docker-compose.Terraform/ter.tf)
