FROM node:14 AS builder
WORKDIR /app
COPY app/ .
RUN yarn install 

RUN yarn build

FROM node:15
COPY --from=builder /app /app
WORKDIR /app
EXPOSE 3000
CMD ["npm", "run", "start"]