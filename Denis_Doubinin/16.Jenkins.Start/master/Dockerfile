FROM alpine:latest

RUN apk update \
    && apk upgrade \
    && apk add --no-cache nginx \
    && adduser -D -g 'www' www \
    && mkdir /www \
    && mkdir -p /run/nginx/ \
    && chown -R www:www /var/lib/nginx \
    && chown -R www:www /www

COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /www

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

