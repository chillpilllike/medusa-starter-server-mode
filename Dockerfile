# Use a stable Node version
FROM node:latest

# Set working directory
WORKDIR /app

RUN yarn build

WORKDIR /.medusa/server

RUN yarn predeploy && yarn run start
