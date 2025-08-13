FROM php:8.2-fpm

RUN apt update && apt install -y \
    zip unzip git curl libpng-dev libonig-dev libxml2-dev libcurl4-openssl-dev \
    && docker-php-ext-install pdo pdo_mysql curl

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN useradd -ms /bin/bash laravel
WORKDIR /var/www/html
RUN chown -R laravel:laravel /var/www/html
USER laravel

USER root

CMD ["php-fpm"]
