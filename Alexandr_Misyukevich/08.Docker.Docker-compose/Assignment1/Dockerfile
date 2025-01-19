FROM mariadb:latest as db


ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=drupal
ENV MYSQL_USER=drupal_user
ENV MYSQL_PASSWORD=drupal_password


FROM drupal:latest


COPY ./sites /var/www/html/sites


RUN docker-php-ext-install pdo pdo_mysql


COPY --from=db /var/lib/mysql /var/lib/mysql


RUN chown -R www-data:www-data /var/www/html/sites
