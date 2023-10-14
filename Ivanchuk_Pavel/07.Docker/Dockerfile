FROM alpine
   
WORKDIR /gumcol_site

COPY site-config.js . 
COPY site/page32002363.html .
COPY package.json .

RUN apk update \
    && apk add --no-cache nodejs npm \
    && rm -rf /var/cache/apk/* \
    && npm install

CMD ["npm", "start"]

EXPOSE 80
