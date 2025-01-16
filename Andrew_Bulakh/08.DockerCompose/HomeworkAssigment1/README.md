# 07.Docker Compose

## Homework Assignment 1: Docker Compose for Application Stacks
docker-compose.yaml 
```bash
services:
  db:
    image: mariadb:latest
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 123456
      MYSQL_DATABASE: wordpress
      MYSQL_USER: andrew
      MYSQL_PASSWORD: 123456
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    ports:
      - "8000:80"
    volumes:
      - wordpress_modules:/var/www/html/modules
      - wordpress_profiles:/var/www/html/profiles
      - wordpress_themes:/var/www/html/themes
      - wordpress_sites:/var/www/html/sites
    restart: always
volumes:
  db_data:
  wordpress_modules:
  wordpress_profiles:
  wordpress_themes:
  wordpress_sites:
```
