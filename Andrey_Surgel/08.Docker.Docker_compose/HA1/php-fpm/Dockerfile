FROM php:8.3-fpm

ADD --chmod=777 https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/
RUN /bin/bash install-php-extensions gd dom iconv mbstring mysqlnd openssl pdo pdo_mysql tokenizer xml zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
