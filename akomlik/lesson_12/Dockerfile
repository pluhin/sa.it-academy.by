FROM node:7-onbuild
LABEL maintainer "komlik.al@gmail.com" 
WORKDIR /usr/src/app
COPY  main.js app/
COPY  package.json app/
RUN npm install
HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1
EXPOSE 8000
CMD [ "npm", "start" ]
