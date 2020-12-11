#!/bin/bash
set -a
. ./.env
set +a
docker exec db-${APP_FQDN}-$VERSION /usr/bin/mysqldump -u root --password=$MYSQL_ROOT_PASSWORD $WORDPRESS_DB_NAME > /var/www/$APP_FQDN/dump.sql
