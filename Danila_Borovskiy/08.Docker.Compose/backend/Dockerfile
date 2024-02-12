FROM node:alpine
WORKDIR /app
COPY package*.json .
RUN npm install --production
COPY . .
EXPOSE 8080
CMD npm run start

