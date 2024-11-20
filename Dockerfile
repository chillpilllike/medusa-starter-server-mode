FROM node:latest

WORKDIR /app

COPY . .

COPY package.json yarn.lock ./

RUN yarn global add @medusajs/medusa-cli

RUN yarn

RUN npx medusa build

# Set the working directory to the Medusa server
WORKDIR /app/.medusa/server

# Expose the application's default port
EXPOSE 9000

# Run migrations and start the server at runtime
CMD ["sh", "-c", "npm run predeploy && npm run start"]
