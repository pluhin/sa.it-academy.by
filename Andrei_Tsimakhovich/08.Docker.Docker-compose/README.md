# 08. Docker. Docker compose

## Homework Assignment 1: Docker Compose for Application Stacks

### Structure of project
|-- docker-compose.yaml  
|-- .env  

1. Create docker-compose file. Drupal 9 + MySql 8.
2. Create .env file for storing passwords. Add .env to .gitignore.
3. Run 
```bash
docker compose up -d 
```
Output:  

```bash
WARN[0000] /home/debian/it-academy-training/08.Docker/docker-compose.yaml: the attribute `version` is obsolete, it will be ignored, please remove it to avoid potential confusion 
[+] Running 30/30
 ✔ db Pulled                                                                                                                                                                                      102.4s 
   ✔ cea172a6e83b Pull complete                                                                                                                                                                    26.1s 
   ✔ 9f0eb82d78dc Pull complete                                                                                                                                                                    26.3s 
   ✔ 30667541f13f Pull complete                                                                                                                                                                    26.7s 
   ✔ f5fefeb7f3b5 Pull complete                                                                                                                                                                    29.2s 
   ✔ 2e7405f0a17c Pull complete                                                                                                                                                                    29.4s 
   ✔ b7cefcf2c641 Pull complete                                                                                                                                                                    29.5s 
   ✔ 38945ff9f35a Pull complete                                                                                                                                                                    40.8s 
   ✔ 3bcd4b133d74 Pull complete                                                                                                                                                                    40.9s 
   ✔ f4511c9955c0 Pull complete                                                                                                                                                                    98.4s 
   ✔ 014654182aa2 Pull complete                                                                                                                                                                    98.6s 
 ✔ drupal Pulled                                                                                                                                                                                  117.2s 
   ✔ 1f7ce2fa46ab Pull complete                                                                                                                                                                    30.9s 
   ✔ 48824c101c6a Pull complete                                                                                                                                                                    31.1s 
   ✔ 249ff3a7bbe6 Pull complete                                                                                                                                                                    68.0s 
   ✔ aa5d47f22b64 Pull complete                                                                                                                                                                    68.2s 
   ✔ e83ad87cf6a6 Pull complete                                                                                                                                                                    73.2s 
   ✔ 92eeb6cb0068 Pull complete                                                                                                                                                                    73.3s 
   ✔ b3a08d032c4e Pull complete                                                                                                                                                                    73.5s 
   ✔ efa151a8cc1c Pull complete                                                                                                                                                                    74.8s 
   ✔ 40d0dc4a1ad5 Pull complete                                                                                                                                                                    75.0s 
   ✔ fce9d6a8b645 Pull complete                                                                                                                                                                    79.1s 
   ✔ bd4364e93fcd Pull complete                                                                                                                                                                    79.3s 
   ✔ 335646805c57 Pull complete                                                                                                                                                                    79.4s 
   ✔ 1a93955009f0 Pull complete                                                                                                                                                                    79.6s 
   ✔ 0c32340e7981 Pull complete                                                                                                                                                                    80.1s 
   ✔ 3dc4cbc7b202 Pull complete                                                                                                                                                                    80.3s 
   ✔ b291792c714e Pull complete                                                                                                                                                                    80.5s 
   ✔ 2d147bac81ed Pull complete                                                                                                                                                                    80.7s 
   ✔ ee455c818fe6 Pull complete                                                                                                                                                                   114.0s 
[+] Running 5/5
 ✔ Network 08docker_default       Created                                                                                                                                                           0.7s 
 ✔ Volume "08docker_drupal_data"  Created                                                                                                                                                           0.0s 
 ✔ Volume "08docker_db_data"      Created                                                                                                                                                           0.0s 
 ✔ Container 08docker-db-1        Started                                                                                                                                                           8.2s 
 ✔ Container 08docker-drupal-1    Started                                                                                                                                                           9.2s 
```

4. Check containers:    

```bash
debian@vbox ~/i/08.Docker (master) [4]> docker ps
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS          PORTS                                     NAMES
040061a97c71   drupal:9-apache   "docker-php-entrypoi…"   13 minutes ago   Up 13 minutes   0.0.0.0:8080->80/tcp, [::]:8080->80/tcp   08docker-drupal-1
67764eed2d3c   mysql:8           "docker-entrypoint.s…"   13 minutes ago   Up 13 minutes   3306/tcp, 33060/tcp                       08docker-db-1
```
5. Check drupal isntall page:  
```debian@vbox ~/i/08.Docker (master)> curl http://localhost:8080```
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="refresh" content="0;url='/core/install.php'" />

        <title>Redirecting to /core/install.php</title>
    </head>
    <body>
        Redirecting to <a href="/core/install.php">/core/install.php</a>.
    </body>
</html> 

                                                                                                                                                                                       ```
6. Connect to db and install drupal.

7. Go to: http://localhost:8080
  
```bash
debian@vbox ~/i/08.Docker (master)> curl http://localhost:8080
<!DOCTYPE html>
<html lang="ru" dir="ltr">
  <head>
    <meta charset="utf-8" />
<meta name="Generator" content="Drupal 9 (https://www.drupal.org)" />
<meta name="MobileOptimized" content="width" />
<meta name="HandheldFriendly" content="true" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="/core/themes/olivero/favicon.ico" type="image/vnd.microsoft.icon" />
<link rel="alternate" type="application/rss+xml" title="" href="http://localhost:8080/rss.xml" />

    <title>Добро пожаловать! | test-drupal</title>
    <link rel="stylesheet" media="all" href="/sites/default/files/css/css_NxdiTg-nD52SF4K3ZaDi8HGjoPWlBBP00ZLH_rbS3U4.css" />
<link rel="stylesheet" media="all" href="/sites/default/files/css/css_VQEigtqWfMa8GddxwXPTNTGwO1-k6PKQ3PsDB0IeNFo.css" />
```

## Homework Assignment 2: Docker build automation (github action)

### Structure of project

root/  
|-- .github/  
 -------------workflows/  
 -------------------docker-build.yaml  
|-- 08.Docker/  
 ------app.py    
 ------Dockerfile  
 ------requirements.txt 

1. Create all files regarding project structure.
2. Create slack space and add new app. 
3. Set up notifications in Slack.
4. Add repository secrets in Github: SLACK_CHANNEL, SLACK_TOKEN, SLACK_WEBHOOK . 
5. Push all changes to remote repo.
6. Check msg in Slack.
