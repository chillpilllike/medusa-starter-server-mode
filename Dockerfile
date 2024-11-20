FROM node:alpine AS build

WORKDIR /app

COPY package.json ./

RUN yarn install

COPY . .

RUN yarn build && yarn telemetry && yarn migrate

ENV NODE_ENV=production

EXPOSE 9000

CMD ["yarn", "start"]
