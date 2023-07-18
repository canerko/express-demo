#FROM node:18
FROM registry.access.redhat.com/ubi9/nodejs-18

# Working directory
WORKDIR /opt/app-root/src

USER default

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#COPY package*.json ./
COPY --chown=default package.json ./

#RUN id && pwd && ls -ld . && ls -l

RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev

# Bundle app source
COPY --chown=default . .

EXPOSE 3000
CMD [ "node", "index.js" ]