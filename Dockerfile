# base image
FROM node:8.11.2-alpine

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /usr/src/app/
RUN npm install

COPY . /usr/src/app
RUN npm run build

# start app
EXPOSE 3000
CMD ["npm", "start"]