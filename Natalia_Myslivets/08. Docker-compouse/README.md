# HA1: Docker Compose for Application Stacks

### docker-compouse ( nginx + php + mysql)

```yaml
version: '3'
services:
    nginx:
      image: nginx:latest
      ports:
        - '8080:80'
      volumes:
        - ./app/:/var/www/html
        - ./defaults/default.conf:/etc/nginx/conf.d/default.conf
      depends_on:
        - php-fpm
        - mysql
      networks:
        - external
        - internal

    php-fpm:
      image: php:fpm-alpine
      volumes:
        - ./app/:/var/www/html/
      ports:
        - '9000:9000'
      networks:
        - internal

    mysql:
      image: mysql:8.0
      container_name: mysql
      command: --default-authentication-plugin=mysql_native_password
      restart: unless-stopped
      env_file: .env

      volumes:
        - ./db-data/:/var/lib/mysql
      networks:
        - internal

networks:
  external:
    driver: bridge
  internal:
    driver: bridge
```

### .env

```properties
MYSQL_ROOT_PASSWORD=drupal
MYSQL_DATABASE=drupal
MYSQL_USER=drupal
MYSQL_PASSWORD=drupal
```

### ./defaults/defaults.conf

```
server {
    listen 80;
    server_name localhost;

    root /var/www/html;
    index index.php index.html index.htm;

    # Redirects requests to index.php if the file is not found
    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    # Passes PHP requests to PHP-FPM container
    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_pass php-fpm:9000; # Replace with your PHP-FPM container name
        fastcgi_index index.php;
    }

    # Logs for Nginx access and errors
    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;
}
```

### ./app/index.html and ./app/index.php

```html
<!DOCTYPE html>
<html>
<body>

<h1>Display Text Input Fields</h1>

<form action="index.php">
  <label for="fname">address: </label>
  <input type="text" id="ip" name="ip"><br><br>
  <input type="submit" value="Submit">
</form>

<p>Click on the submit button to ping host.</p>

</body>
</html>
```

```php
<?php
    	$target = $_GET[ 'ip' ];
    	exec( "ping -c 4 $target", $output, $status);
	echo '<pre>';
	print_r($output);
	echo '</pre>';
   
?>

```

### comands and results

```
docker-compose up -d

root@debian10:~/docker# docker-compose ps -a
      Name                    Command               State                    Ports                  
----------------------------------------------------------------------------------------------------
docker_nginx_1     /docker-entrypoint.sh ngin ...   Up      0.0.0.0:8080->80/tcp,:::8080->80/tcp    
docker_php-fpm_1   docker-php-entrypoint php-fpm    Up      0.0.0.0:9000->9000/tcp,:::9000->9000/tcp
mysql              docker-entrypoint.sh --def ...   Up      3306/tcp, 33060/tcp                     
root@debian10:~/docker# curl http://localhost:8080/?ip=localhost
<pre>Array
(
    [0] => PING localhost (127.0.0.1): 56 data bytes
    [1] => 64 bytes from 127.0.0.1: seq=0 ttl=42 time=0.082 ms
    [2] => 64 bytes from 127.0.0.1: seq=1 ttl=42 time=0.058 ms
    [3] => 64 bytes from 127.0.0.1: seq=2 ttl=42 time=0.136 ms
    [4] => 64 bytes from 127.0.0.1: seq=3 ttl=42 time=0.080 ms
    [5] => 
    [6] => --- localhost ping statistics ---
    [7] => 4 packets transmitted, 4 packets received, 0% packet loss
    [8] => round-trip min/avg/max = 0.058/0.089/0.136 ms
)
```

# HA2:

## Docker action:

```yaml
name: Docker Image Publish

on:
  release:
    types: [published]
  push:
    branches: [ "master" ]
    # Publish semver tags as releases.
    #tags: [ 'v*.*.*' ]
  pull_request:
    branches: [ "master" ]

jobs:
  push_to_registries:
    name: Push Docker image
    runs-on: ubuntu-latest
    permissions:
      packages: write
      contents: read
      
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
      - name: Login to GitHub Container Registry
        uses: docker/login-action@v3
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.GITHUB_TOKEN }}
          
      - name: Build and push
        uses: docker/build-push-action@v5
        with:
          context: .
          file: ./Dockerfile
          push: true
          tags: ghcr.io/nataliabelogolovaya/app_docker_build
```

## Dockerfile:

```
FROM python:latest
RUN mkdir /app
WORKDIR /app
COPY app/ /app/
EXPOSE 5000
CMD [ "python", "test_app.py" ]
```

### application:

```python
from math import factorial

class Factorial:
   def __init__(self, num):
      self.num=num

   def factorial(self,num):
      if num == 0:
        return 1
      factor=1
      for i in range(1, num+1):
        factor=factor*i
      return factor

def main():

    factor=Factorial(int(input()))
    print(factor.factorial(factor.num))

if __name__ == "__main__":
    main()
```

```python
#application test
from factorial import Factorial
import unittest


class TestFactorial(unittest.TestCase):

  def setUp(self):
    self.factor = Factorial(self)

  def test_factorial(self):
    self.assertEqual(self.factor.factorial(10), 3628800,
                     "Factorial of 10 is 3628800")
    self.assertEqual(self.factor.factorial(2), 2, "Factorial of 2 is 2")

if __name__ == "__main__":
  unittest.main()
```

## Check

```
root@debian10:~/docker-app# docker images
REPOSITORY                                     TAG          IMAGE ID       CREATED         SIZE
ghcr.io/nataliabelogolovaya/app_docker_build   latest       e540c63a573b   3 minutes ago   1.02GB
flask-app                                      latest       3b549db42937   3 days ago      1.06GB
php                                            fpm-alpine   0493eae3fde0   2 weeks ago     83MB
mysql                                          8.0          738c35640937   3 weeks ago     603MB
nginx                                          latest       b690f5f0a2d5   3 months ago    187MB
hello-world                                    latest       d2c94e258dcb   9 months ago    13.3kB
root@debian10:~/docker-app# docker run -d ghcr.io/nataliabelogolovaya/app_docker_build 
6ffce66bc2cd7eaa234f428438e3c5b738440707fbb08c3354b7663a1f4a7d51
```

