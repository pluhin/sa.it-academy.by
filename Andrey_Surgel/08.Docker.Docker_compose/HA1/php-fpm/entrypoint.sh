#!/bin/bash

set -e

env

if [[ -n "$1" ]]; then
    exec "$@"
else
    composer install
    sleep 10
    php artisan migrate --database=mysql --force
    chown -R www-data storage public/uploads bootstrap/cache
    php-fpm -F -R
fi