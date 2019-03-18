FROM nginx

MAINTAINER Ivan Evseichik
RUN  mkdir -p /var/www/devops_by
COPY devops.by.conf /etc/nginx/conf.d/
COPY index.html /var/www/devops_by/
EXPOSE 80
