FROM node:latest

WORKDIR /app/medusa

COPY . .

RUN apt-get update && apt-get install -y python3 python3-pip python-is-python3

RUN yarn global add @medusajs/medusa-cli

RUN yarn

RUN yarn build

RUN yarn run predeploy

CMD medusa migrations run && yarn start
# Set the working directory to the Medusa server
WORKDIR /app/.medusa/server

# Run migrations and start the server
CMD ["sh", "-c", "yarn run start"]
