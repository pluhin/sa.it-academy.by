
#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.

FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/
COPY cert.crt /etc/ssl/
COPY cert.key /etc/ssl
#COPY sample.html /usr/share/nginx/html


# Define mountable directories.
VOLUME ["/etc/nginx/certs", "/etc/nginx/conf.d", "/var/www/wordpress"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
