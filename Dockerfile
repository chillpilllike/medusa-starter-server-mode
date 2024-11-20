# Use a stable Node version
FROM node:latest

# Set working directory
WORKDIR /app

COPY . .

RUN apt-get update

RUN yarn global add @medusajs/medusa-cli

RUN yarn

RUN yarn build

WORKDIR /app/.medusa/server

COPY . .

CMD yarn run predeploy && yarn run start
