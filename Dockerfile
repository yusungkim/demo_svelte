FROM node:18

WORKDIR /usr/src/app

COPY package.json .

RUN yarn

COPY . .

EXPOSE 5000
EXPOSE 5001

CMD ["npm", "run", "dev"]