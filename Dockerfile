FROM node:alpine AS build

# Set working directory
WORKDIR /app

COPY . .

# Copy only package.json and yarn.lock first for caching
COPY package.json yarn.lock ./

# Copy the rest of the application files


# Install Medusa CLI globally (optional, for CLI usage within the container)
RUN yarn global add @medusajs/medusa-cli

# Install dependencies
RUN yarn install

# Build the Medusa application
RUN yarn build

# Set working directory to the Medusa server
#WORKDIR /app/.medusa/server

# Expose the application's default port
EXPOSE 9000

# Run migrations and start the server at runtime
CMD ["sh", "-c", "npm run predeploy && npm run start"]
