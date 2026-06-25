# 08.Docker compose

### Assignment 1:

- Flask-приложение считает количество посещений (счетчик увеличивается при обновлении страницы)
- Данные хранятся в PostgreSQL

Запуск
```
docker compose up --build
```

Проверка
```
curl http://localhost:5001
```

Вывод:
`{"message":"Flask + PostgreSQL running","visits":11}`