### Homework Assignment 1: Docker Compose for Application Stacks

```bash
mkdir task.1
vim docker-compose.yaml
```

```yaml


services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: XXXXXXXXXX
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: XXXXXXXXXX

  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8000:80"
    volumes:
      - wordpress_themes:/var/www/html/wp-content/themes
      - wordpress_plugins:/var/www/html/wp-content/plugins
      - wordpress_uploads:/var/www/html/wp-content/uploads
    restart: always
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: XXXXXXXXXX
      WORDPRESS_DB_NAME: wordpress

volumes:
  db_data:
  wordpress_themes:
  wordpress_plugins:
  wordpress_uploads:
```
```bash
docker compose up -d


 [+] Running 11/35
 ⠙ wordpress [⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀] Pulling                                                                                                                                                                                                             12.1s 
   ✔ 8a628cdd7ccc Already exists                                                                                                                                                                                                                           0.0s 
   ✔ 0a85361c459c Pull complete                                                                                                                                                                                                                            9.3s 
   ⠇ 05de80987da0 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 0990af6e132e Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 1eb9bf28dacd Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ c4d2115b4d8e Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 0ff907e301b0 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ c94d5002a272 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 51fd3dcac87d Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ dbd03e28478e Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 9d6b76948f51 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 054cc9f6db6e Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ eb505bfebc59 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 4f4fb700ef54 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ f39d7ba7e8eb Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 754471b71d01 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 11232bf31512 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 19a3742c2b84 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ fa2cdfad9a7e Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 089fd216f0b4 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ 767c98c0a055 Waiting                                                                                                                                                                                                                                  9.9s 
   ⠇ f0d3d80959dd Waiting                                                                                                                                                                                                                                  9.9s 
 ⠙ db [⣿⣿⣿⣿⣿⣿⣿⣿⣄⣿⣿] 104.1MB / 137.9MB Pulling                                                                                                                                                                                                             12.1s 
   ✔ 20e4dcae4c69 Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ 1c56c3d4ce74 Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ e9f03a1c24ce Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ 68c3898c2015 Pull complete                                     [+] Running 11/35
 ⠹ wordpress [⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀] Pulling                      12.2s                                           8.9s 
   ✔ 8a628cdd7ccc Already exists                                   0.0s 
   ✔ 0a85361c459c Pull complete                                    9.3s                                            8.9s 
   ⠏ 05de80987da0 Waiting                                          10.0s 
   ⠏ 0990af6e132e Waiting                                          10.0s                                           9.0s 
   ⠏ 1eb9bf28dacd Waiting                                          10.0s         ]  13.63MB/25.53MB
   ⠏ c4d2115b4d8e Waiting                                          10.0s                                           9.9s 
   ⠏ 0ff907e301b0 Waiting                                          10.0s 
   ⠏ c94d5002a272 Waiting                                          10.0s                                           5.6s 
   ⠏ 51fd3dcac87d Waiting                                          10.0s          ]  22.54MB/56.29MB
   ⠏ dbd03e28478e Waiting                                          10.0s                                           9.9s 
   ⠏ 9d6b76948f51 Waiting                                          10.0s 
   ⠏ 054cc9f6db6e Waiting                                          10.0s                                           6.7s 
   ⠏ eb505bfebc59 Waiting                                          10.0s 
   ⠏ 4f4fb700ef54 Waiting                                          10.0s                                           8.6s 
                                               8.7s
   ✔ 1c56c3d4ce74 Pull complete                                                                                                                                                                                                                            8.7s 
[+] Running 35/35 Pull complete
 ✔ wordpress Pulled                                                                                                                                                                                                                                       35.7s 
   ✔ 8a628cdd7ccc Already exists                                                                                                                                                                                                                           0.0s 
   ✔ 0a85361c459c Pull complete                                                                                                                                                                                                                            9.3s 
   ✔ 05de80987da0 Pull complete                                                                                                                                                                                                                           29.5s 
   ✔ 0990af6e132e Pull complete                                                                                                                                                                                                                           29.6s 
   ✔ 1eb9bf28dacd Pull complete                                                                                                                                                                                                                           30.1s 
   ✔ c4d2115b4d8e Pull complete                                                                                                                                                                                                                           30.1s 
   ✔ 0ff907e301b0 Pull complete                                                                                                                                                                                                                           30.1s 
   ✔ c94d5002a272 Pull complete                                                                                                                                                                                                                           30.3s 
   ✔ 51fd3dcac87d Pull complete                                                                                                                                                                                                                           30.3s 
   ✔ dbd03e28478e Pull complete                                                                                                                                                                                                                           30.8s 
   ✔ 9d6b76948f51 Pull complete                                                                                                                                                                                                                           30.8s 
   ✔ 054cc9f6db6e Pull complete                                                                                                                                                                                                                           30.9s 
   ✔ eb505bfebc59 Pull complete                                                                                                                                                                                                                           30.9s 
   ✔ 4f4fb700ef54 Pull complete                                                                                                                                                                                                                           30.9s 
   ✔ f39d7ba7e8eb Pull complete                                                                                                                                                                                                                           31.7s 
   ✔ 754471b71d01 Pull complete                                                                                                                                                                                                                           32.1s 
   ✔ 11232bf31512 Pull complete                                                                                                                                                                                                                           32.1s 
   ✔ 19a3742c2b84 Pull complete                                                                                                                                                                                                                           32.2s 
   ✔ fa2cdfad9a7e Pull complete                                                                                                                                                                                                                           32.2s 
   ✔ 089fd216f0b4 Pull complete                                                                                                                                                                                                                           33.4s 
   ✔ 767c98c0a055 Pull complete                                                                                                                                                                                                                           33.4s 
   ✔ f0d3d80959dd Pull complete                                                                                                                                                                                                                           33.4s 
 ✔ db Pulled                                                                                                                                                                                                                                              21.5s 
   ✔ 20e4dcae4c69 Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ 1c56c3d4ce74 Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ e9f03a1c24ce Pull complete                                                                                                                                                                                                                            8.7s 
   ✔ 68c3898c2015 Pull complete                                                                                                                                                                                                                            8.9s 
   ✔ 6b95a940e7b6 Pull complete                                                                                                                                                                                                                            8.9s 
   ✔ 90986bb8de6e Pull complete                                                                                                                                                                                                                            9.0s 
   ✔ ae71319cb779 Pull complete                                                                                                                                                                                                                           10.1s 
   ✔ ffc89e9dfd88 Pull complete                                                                                                                                                                                                                           10.1s 
   ✔ 43d05e938198 Pull complete                                                                                                                                                                                                                           19.2s 
   ✔ 064b2d298fba Pull complete                                                                                                                                                                                                                           19.2s 
   ✔ df9a4d85569b Pull complete                                                                                                                                                                                                                           19.2s 
[+] Running 7/7
 ✔ Network task1_default             Created                                                                                                                                                                [+] Running 7/7
 ✔ Network task1_default             Created                                                                                                                                                                
                                               0.0s
 ✔ Volume "task1_wordpress_plugins"  Created                                                                                                                                                                
                                               0.0s
 ✔ Volume "task1_wordpress_uploads"  Created                                                                                                                                                                
                                               0.0s
 ✔ Volume "task1_db_data"            Created                                                                                                                                                                
                                              

docker compose ps

NAME                IMAGE              COMMAND                  SERVICE     CREATED          STATUS          PORTS
task1-db-1          mysql:5.7          "docker-entrypoint.s…"   db          47 seconds ago   Up 45 seconds   3306/tcp, 33060/tcp
task1-wordpress-1   wordpress:latest   "docker-entrypoint.s…"   wordpress   45 seconds ago   Up 45 seconds   0.0.0.0:8000->80/tcp, [::]:8000->80/tcp  


docker compose logs wordpress

wordpress-1  | WordPress not found in /var/www/html - copying now...
wordpress-1  | Complete! WordPress has been successfully copied to /var/www/html
wordpress-1  | No 'wp-config.php' found in /var/www/html, but 'WORDPRESS_...' variables supplied; copying 'wp-config-docker.php' (WORDPRESS_DB_HOST WORDPRESS_DB_NAME WORDPRESS_DB_PASSWORD WORDPRESS_DB_USER)
wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-1  | AH00558: apache2: Could not reliably determine the server's fully qualified domain name, using 172.18.0.3. Set the 'ServerName' directive globally to suppress this message
wordpress-1  | [Fri Apr 11 15:38:18.782006 2025] [mpm_prefork:notice] [pid 1:tid 1] AH00163: Apache/2.4.62 (Debian) PHP/8.2.28 configured -- resuming normal operations
wordpress-1  | [Fri Apr 11 15:38:18.782098 2025] [core:notice] [pid 1:tid 1] AH00094: Command line: 'apache2 -D FOREGROUND'
wordpress-1  | 172.18.0.1 - - [11/Apr/2025:15:40:18 +0000] "GET / HTTP/1.1" 302 349 "-" "curl/8.5.0"
wordpress-1  | 172.18.0.1 - - [11/Apr/2025:15:43:18 +0000] "GET / HTTP/1.1" 302 349 "-" "curl/8.5.0"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:46 +0000] "GET / HTTP/1.1" 302 410 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:46 +0000] "GET /wp-admin/install.php HTTP/1.1" 200 4683 "-" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/css/l10n.min.css?ver=6.7.2 HTTP/1.1" 200 1103 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-includes/css/buttons.min.css?ver=6.7.2 HTTP/1.1" 200 1808 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/css/install.min.css?ver=6.7.2 HTTP/1.1" 200 2134 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-includes/css/dashicons.min.css?ver=6.7.2 HTTP/1.1" 200 36068 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/css/forms.min.css?ver=6.7.2 HTTP/1.1" 200 7032 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-includes/js/jquery/jquery.min.js?ver=3.7.1 HTTP/1.1" 200 30715 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/js/language-chooser.min.js?ver=6.7.2 HTTP/1.1" 200 615 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-includes/js/jquery/jquery-migrate.min.js?ver=3.4.1 HTTP/1.1" 200 5216 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/images/wordpress-logo.svg?ver=20131107 HTTP/1.1" 200 1810 "http://192.168.56.103:8000/wp-admin/css/install.min.css?ver=6.7.2" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/images/spinner.gif HTTP/1.1" 200 3941 "http://192.168.56.103:8000/wp-admin/css/install.min.css?ver=6.7.2" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /favicon.ico HTTP/1.1" 302 409 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:47 +0000] "GET /wp-admin/install.php HTTP/1.1" 200 4683 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:48 +0000] "GET /favicon.ico HTTP/1.1" 302 409 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:47:48 +0000] "GET /wp-admin/install.php HTTP/1.1" 200 4683 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 127.0.0.1 - - [11/Apr/2025:15:47:54 +0000] "OPTIONS * HTTP/1.0" 200 126 "-" "Apache/2.4.62 (Debian) PHP/8.2.28 (internal dummy connection)"
wordpress-1  | 127.0.0.1 - - [11/Apr/2025:15:47:55 +0000] "OPTIONS * HTTP/1.0" 200 126 "-" "Apache/2.4.62 (Debian) PHP/8.2.28 (internal dummy connection)"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "POST /wp-admin/install.php?step=1 HTTP/1.1" 200 2782 "http://192.168.56.103:8000/wp-admin/install.php" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/clipboard.min.js?ver=2.0.11 HTTP/1.1" 200 3494 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/zxcvbn-async.min.js?ver=1.0 HTTP/1.1" 200 599 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/dist/hooks.min.js?ver=4d63a3d491d11ffd8ac6 HTTP/1.1" 200 1993 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/dist/i18n.min.js?ver=5e580eb46a90c2b997e6 HTTP/1.1" 200 4012 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-admin/js/password-strength-meter.min.js?ver=6.7.2 HTTP/1.1" 200 964 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/underscore.min.js?ver=1.13.7 HTTP/1.1" 200 7681 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/wp-util.min.js?ver=6.7.2 HTTP/1.1" 200 1098 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/dist/dom-ready.min.js?ver=f77871ff7694fffea381 HTTP/1.1" 200 662 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/dist/a11y.min.js?ver=3156534cc54473497e14 HTTP/1.1" 200 1298 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-admin/js/user-profile.min.js?ver=6.7.2 HTTP/1.1" 200 2954 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 192.168.56.104 - - [11/Apr/2025:15:48:03 +0000] "GET /wp-includes/js/zxcvbn.min.js HTTP/1.1" 200 400393 "http://192.168.56.103:8000/wp-admin/install.php?step=1" "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/132.0.0.0 YaBrowser/25.2.0.0 Safari/537.36"
wordpress-1  | 127.0.0.1 - - [11/Apr/2025:15:48:09 +0000] "OPTIONS * HTTP/1.0" 200 126 "-" "Apache/2.4.62 (Debian) PHP/8.2.28 (internal dummy connection)"
wordpress-1  | 172.18.0.1 - - [11/Apr/2025:15:59:06 +0000] "GET / HTTP/1.1" 302 349 "-" "curl/8.5.0"
```
### Do all my homework on virtualbox/machine - ubuntu_server/ VirtualBox Host-Only Ethernet Adapter/ so write on my home machine in browser http://192.168.56.103:8000 my ubuntu_server ip and wordpress port. All works!!!

### Homework Assignment 2: Docker build automation (github action)
```bash
vim build.yaml # put it in .github/workflows/
vim app.py
vim wsgi.py
vim Dockerfile
```
push it to github