

# Use a stable Node version
FROM node:latest

# Set working directory
WORKDIR /app

# Copy only package.json and yarn.lock first for dependency installation caching
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install

# Copy the rest of the application files
COPY . .

RUN yarn global add @medusajs/medusa-cli

# Build the application
RUN yarn build

# Set the working directory to the Medusa server
WORKDIR /app/.medusa/server

# Run migrations and start the server
CMD ["sh", "-c", "yarn run predeploy && yarn run start"]
