server {
    listen 80 default_server;
    listen [::]:80 default_server ipv6only=on;

    root /var/www/example.com/html;
    index index.html index.htm;

    server_name example.com www.example.com;

    location / {
        try_files $uri $uri/ =404;
    }
}