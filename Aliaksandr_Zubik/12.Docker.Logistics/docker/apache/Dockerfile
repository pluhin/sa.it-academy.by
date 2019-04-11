FROM php:7.0-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxslt-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install mbstring pdo_mysql mysqli tokenizer mcrypt gd iconv zip xsl
RUN pecl install redis && docker-php-ext-enable redis

RUN mkdir -p /var/www/logs && chmod 777 /var/www/logs

RUN apt-get -y --fix-missing install monit cron wget nano

RUN service cron start
RUN export EDITOR=nano

RUN echo '* * * * * php -f /var/www/html/local/command/QueueAppCommand.php 2>&1 >> /var/www/logs/QueueAppCommand.log' >>/etc/crontab
RUN echo '* * * * * php -f /var/www/html/local/command/QueueDownloadCommand.php 2>&1 >> /var/www/logs/QueueDownloadCommand.log' >>/etc/crontab
RUN echo '* * * * * php -f /var/www/html/local/command/QueueFastCommand.php 2>&1 >> /var/www/logs/QueueFastCommand.log' >>/etc/crontab
RUN echo '* * * * * php -f /var/www/html/local/command/QueueImportCommand.php 2>&1 >> /var/www/logs/QueueImportCommand.log'  >>/etc/crontab

RUN echo  'ServerName localhost' >> /etc/apache2/apache2.conf

RUN a2enmod rewrite
RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data
