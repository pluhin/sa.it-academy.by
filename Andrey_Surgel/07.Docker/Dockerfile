FROM node:24

WORKDIR /app

COPY sample-nodejs/package.json ./


RUN npm install

COPY sample-nodejs/ ./

EXPOSE 3000


RUN useradd -ms /bin/bash test
USER test
CMD ['npm','start']
