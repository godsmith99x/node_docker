#    ___             _                  _  _    _                                
#   / _ \  ___    __| | ___  _ __ ___  (_)| |_ | |__                                
#  / /_\/ / _ \  / _` |/ __|| '_ ` _ \ | || __|| '_ \                               
# / /_\\ | (_) || (_| |\__ \| | | | | || || |_ | | | |                              
# \____/  \___/  \__,_||___/|_| |_| |_||_| \__||_| |_|                              
#                                         


FROM node:current-alpine
#Set WORKDIR in container
WORKDIR /usr/app
#Update container packages
RUN apk update && apk upgrade
#Update to latest version of npm
RUN npm install -g npm@latest
#COPY from/path/on/host to/path/in/container
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
#run 'sudo docker run -v [/path/on/host]:[/path/on/container] -p 3000:3000  -d --name [containerName] [imageName]' to run the container.
#-v does bind mount of volume on host to volume on container (/path/on/host can be abbreviated to $(pwd) if mounting the current directory), -p connects port 3000 in host to port 3000 in container, -d runs container detached















