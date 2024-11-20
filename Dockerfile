# Use a stable Node version
FROM node:latest

# Set working directory
WORKDIR /app

RUN yarn install

RUN yarn build

WORKDIR /.medusa/server

CMD yarn run predeploy && yarn run start
