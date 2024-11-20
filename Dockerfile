FROM node:alpine AS build

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

RUN npm run build && npm run telemetry && npm run migrate

ENV NODE_ENV=production

EXPOSE 9000

CMD ["npm", "run", "start"]
