FROM node:18.15.0-bullseye

ARG WORKDIR

ENV HOME=/${WORKDIR}

WORKDIR ${HOME}

RUN apt update \
    && yarn install

COPY . ./
COPY package.json /client/package.json
COPY yarn.lock /client/yarn.lock

CMD ["yarn", "dev", "--host"]
