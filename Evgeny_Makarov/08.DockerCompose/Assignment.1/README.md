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


### Assignment 2:

GitHub Actions:
<img width="1061" height="871" alt="Снимок экрана — 2026-06-25 в 23 38 46" src="https://github.com/user-attachments/assets/dd6dd6fd-e40a-4afd-bdb2-905150f43dcb" />


Slack notification:
<img width="1206" height="648" alt="IMG_6274" src="https://github.com/user-attachments/assets/1475acab-f938-4898-a925-5c4842b3bc4d" />
