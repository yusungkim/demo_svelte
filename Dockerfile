FROM node:18

WORKDIR /usr/src/app

COPY package.json .

RUN yarn

COPY . .

EXPOSE 3000
EXPOSE 3001

CMD ["npm", "run", "dev"]