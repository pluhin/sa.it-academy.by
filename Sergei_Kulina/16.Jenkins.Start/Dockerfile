FROM nginx:mainline-alpine

COPY ./jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY ./nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx"]