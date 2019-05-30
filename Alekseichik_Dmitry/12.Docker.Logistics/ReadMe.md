# Hometask 12.
### Docker. Logistics

#### What was done:

Automate task 11. Docker. Lading by Jenkins + (already automated, please see my Hometask 11)

- Use remote repo as source for build image + (same)
- Make image locally (on Jenkins master/Slave) + (same)
- Push image on Docker Hub + (same)

Create docker compose file which contains the following applications:
- Web server (with links to the another Web apps) (+ Done = nginx)
- sonarr (+ Done)
- radarr (+ Done)
- All settings of this applications should be added during docker-compose start from folder of project (+ Done, see \docker-compose.yaml)

#### Here is some tests output:

``` bash

docker-compose ps

  Name            Command          State           Ports
-----------------------------------------------------------------
radar       /init                  Up      0.0.0.0:7878->7878/tcp
sonar       /init                  Up      0.0.0.0:8989->8989/tcp
webserver   nginx -g daemon off;   Up      0.0.0.0:8000->80/tcp


curl 192.168.100.33:8000

<html>
<head>

</head>
<body>
Welcome to:
<p>
    "Sonar link http://192.168.100.33:8989"
    <a href="http://192.168.100.33:8989">GO</a>
</p>
<p>
    "Radar link http://192.168.100.33:7878"
    <a href="http://192.168.100.33:7878">GO</a>
</p>
</body>
</html>

curl http://192.168.100.33:8989 | grep sonar
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  4858    0         <i class="icon-sonarr-back-to-top visible-lg-inline" title="Back to the top!"></i>
 4858    0     0   948k      0 --:--:-- --:--:-- --:--:--  948k


curl http://192.168.100.33:7878 | grep radar
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5523    0  5523    0     0  34304      0 --:--:-- --:--:-- --:--:-- 34518
        <i class="icon-radarr-back-to-top visible-lg-inline" title="Back to the top!"></i>

```