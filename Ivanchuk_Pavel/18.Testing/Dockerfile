FROM alpine

WORKDIR /gumcol_site

RUN adduser -D gumcol

COPY site-config.js .
COPY site/page32002363.html ./site
COPY package.json .

RUN apk update \
    && apk add --no-cache nodejs npm \
    && rm -rf /var/cache/apk/* \
    && npm install

USER gumcol

CMD ["npm", "start"]

EXPOSE 80
