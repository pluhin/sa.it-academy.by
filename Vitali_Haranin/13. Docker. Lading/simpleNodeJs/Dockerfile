FROM node:8

# Папка приложения
ARG APP_DIR="/var/app"
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

# Установка зависимостей
RUN git clone https://github.com/vitalik-vitalic/homework13-nodedistr.git

WORKDIR /var/app/homework13-nodedistr

RUN npm install

# Уведомление о порте, который будет прослушивать работающее приложение
EXPOSE 3000

# Запуск проекта
CMD ["npm", "start"]