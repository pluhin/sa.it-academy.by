user  {{ nginx_user }};
worker_processes  {{ worker_processes }};
worker_priority     -1;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections  {{ worker_connections }};
}

http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
    access_log  /var/log/nginx/access.log  main;

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout  65;
    reset_timedout_connection  on;
    client_body_timeout        35;
    send_timeout               30;

    gzip on;
    gzip_min_length     1000;
    gzip_vary on;
    gzip_proxied        expired no-cache no-store private auth;
    gzip_types          text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript;
    gzip_disable        "msie6";

    types_hash_max_size 2048;
    client_max_body_size {{ client_max_body_size }};
    proxy_buffer_size   64k;
    proxy_buffers   4 64k;
    proxy_busy_buffers_size   64k;
    server_names_hash_bucket_size 64;

    include /etc/nginx/modules-enabled/*.conf;
    include /etc/nginx/conf.d/*.conf;
    include /etc/nginx/sites-enabled/*;
}
