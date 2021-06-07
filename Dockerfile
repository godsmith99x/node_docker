FROM node:current-alpine
#Set WORKDIR in container
WORKDIR /app
#Update container packages
RUN apk update && apk upgrade
#Update to latest version of npm
RUN npm install -g npm@latest
#COPY from/path/on/localmachine to/path/in/container
COPY package.json .
#Install all dependencies, including express, occurs at build time
RUN npm install
#COPY app files into container
COPY . .
#The Expose step is just for documentation, it does nothing
EXPOSE 3000 
#Give the container the command to start, occurs at run time
CMD [ "node", "index.js" ]


# run 'sudo docker build -t [imageName] .' to build the image















