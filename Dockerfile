FROM debian:buster-slim

RUN apt-get update
# RUN apt-get -y install curl gnupg git rsync build-essential python
RUN curl -sL https://deb.nodesource.com/setup_14.x  | bash -
RUN apt-get -y install nodejs

WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# COPY package-docker.json ./package.json
COPY . ./
RUN npm install
RUN npm run build

EXPOSE 3000
CMD [ "npm", "run", "start" ]