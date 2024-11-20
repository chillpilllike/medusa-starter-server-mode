# Use a stable Node version
FROM node:latest

# Set working directory
WORKDIR /app

COPY . .

RUN yarn global add @medusajs/medusa-cli@1.3.23

RUN yarn install

RUN yarn build

WORKDIR /app/.medusa/server

CMD yarn run predeploy && yarn run start
