server {
    listen 80;
    listen [::]:80;

    root /var/www/test.com/html;
    index index.html index.htm;

    server_name test.com www.test.com;

    location / {
        try_files $uri $uri/ =404;
    }
}