# 19. Jenkins. Start
## Deploy Jenkins inside your home environment
### install plugins: Ansible, slack notification
![plugins-slack](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2021.53.58.png?raw=true)
![plugins-ansible](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2021.54.14.png?raw=true)
### add restricted user to view Jobs, without any changes inside Jobs and Jenkins settings
![user](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2021.53.21.png?raw=true)
### Hide Jenkins behind the web server (Nginx, Apache)

```bash
cat /etc/nginx/site-available/default
```
```bash
server {
    listen 80;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    location ~ /\. {
        deny all;
    }
}
```
![nginx](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2022.04.53.png?raw=true)

## Create Job

### 1
```bash
#!/bin/bash
curl -G -d country="BY" -d year="2024" -d pretty -d key="6867f807-89d1-426a-91a6-36783f177f25" "https://holidayapi.com/v1/holidays"

```
![job1](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2022.23.52.png?raw=true)
### 2
```bash
#!/bin/python3
import requests

url = "https://api.nbrb.by/exrates/rates?periodicity=0"
response = requests.get(url)
data = response.json()

for currency in data:
    abbreviation = currency["Cur_Abbreviation"]
    official_rate = currency["Cur_OfficialRate"]
    print(f"{abbreviation}: {official_rate}")
```
![job2](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2022.31.20.png?raw=true)
### slack
![slack](https://github.com/ussnorma/Git.Hosting.03/blob/main/screnshots/%D0%A1%D0%BD%D0%B8%D0%BC%D0%BE%D0%BA%20%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B0%202024-03-27%20%D0%B2%2022.39.10.png?raw=true)