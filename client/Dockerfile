FROM node:18.15.0-bullseye

ARG WORKDIR

ENV HOME=/${WORKDIR}

WORKDIR ${HOME}

RUN apk update && npm install -g npm

CMD ["npm", "run", "dev"]