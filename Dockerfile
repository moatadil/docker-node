FROM node:16.4.0-alpine as base

FROM base as development

WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install
COPY . .
EXPOSE 4000
CMD [ "npm","run","start-dev" ]

FROM base as production

WORKDIR /app
COPY package.json .
ARG NODE_ENV
RUN npm install --only=production
COPY . .
EXPOSE 4000
CMD [ "npm","start" ]
