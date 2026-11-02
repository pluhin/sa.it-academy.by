# Фиксируем точную стабильную версию alpine-образа nginx
FROM nginx:1.27.2-alpine

# Указываем метаданные
LABEL maintainer="aion.fiend@gmail.com"

# Обновляем зависимости и ставим curl для шага проверки (healthcheck) в Jenkins без кэширования
RUN apk add --no-cache curl=8.11.0-r0

# Копируем наш статический веб-интерфейс в дефолтную директорию Nginx
COPY index.html /usr/share/nginx/html/index.html

# Декларируем стандартный HTTP-порт
EXPOSE 80

# Запускаем Nginx в фоновом режиме (JSON-формат согласно правилам hadolint)
CMD ["nginx", "-g", "daemon off;"]
