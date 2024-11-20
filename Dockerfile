FROM node:latest

WORKDIR /app/medusa

COPY . .

COPY package.json yarn.lock ./

RUN yarn global add @medusajs/medusa-cli

RUN yarn

RUN yarn build

# RUN yarn run predeploy

# Set the working directory to the Medusa server
WORKDIR /app/.medusa/server

COPY package.json yarn.lock ./

# Run migrations and start the server
CMD ["sh", "-c", "yarn run start"]
