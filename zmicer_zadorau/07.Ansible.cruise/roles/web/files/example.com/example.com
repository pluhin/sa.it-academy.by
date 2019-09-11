server {
        listen 80;
        listen [::]:80;
        root /var/www/example.com/html;
        index index.html index.htm index.nginx-debian.html;
        server_name example.com www.example.com centos.example.com ubuntu.example.com;
        location / {
                try_files $uri $uri/ =404;
        }


}
