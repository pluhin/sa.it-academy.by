# 19.Jenkisn.Start
## Install Jenkins

![Jenkins](https://i.ibb.co/ZKLxJV5/Screenshot-from-2023-12-10-23-52-16.png)
![Jenkins](https://i.ibb.co/vmn82rC/Screenshot-from-2023-12-10-23-53-34.png)

## Setup the following
### Install plugins: Ansible, slack notification
![Jenkins](https://i.ibb.co/fXNx4m7/Screenshot-from-2023-12-10-23-55-56.png)
![Jenkins](https://i.ibb.co/C26MfyG/Screenshot-from-2023-12-10-23-56-56.png)
### User to view Jobs, without any changes inside Jobs and Jenkins settings
![Jenkins](https://i.ibb.co/C9w8swW/Screenshot-from-2023-12-10-23-58-18.png)

## Hide Jenkins behind the web server (Nginx, Apache)
```
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
![Jenkins](https://i.ibb.co/pXgnvs5/Screenshot-from-2023-12-11-00-04-18.png)

## Create Job
### Inform about exchange rates for current day
![Jenkins](https://i.ibb.co/9vBpMRK/Screenshot-from-2023-12-11-00-06-20.png)
### Check if today holiday in Belarus
```groovy
import groovy.json.JsonSlurper
import java.text.SimpleDateFormat
import java.util.Calendar

def currentDate = new Date()

def formattedDate = new SimpleDateFormat("yyyy-MM-dd").format(currentDate)

def apiUrl = "https://holidayapi.com/v1/holidays?pretty&country=BY&year=2022&key=a8e8bffe-65ad-4ce9-b415-10115010300d"

def response = new URL(apiUrl).text

def holidays = new JsonSlurper().parseText(response)

def isHoliday = holidays.holidays.any { it.date == formattedDate }

if (isHoliday) {
    println "Сегодня выходной!"
} else {
    println "Сегодня не выходной."
}
```
![Jenkins](https://i.ibb.co/4SKfwrc/Screenshot-from-2023-12-11-00-09-54.png)

## message in slack
![Jenkins](https://i.ibb.co/BPwCsgx/Screenshot-from-2023-12-11-00-11-32.png)