FROM node:alpine
WORKDIR "/app"
COPY ./package.json ./
RUN npm install --registry=http://registry.npmjs.org
COPY . .
CMD ["npm", "run", "start"]
