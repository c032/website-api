FROM node:lts-alpine

USER node

COPY --chown=node:node ./ /home/node/app/

WORKDIR /home/node/app/

RUN \
  --mount=type=cache,target=/home/node/.npm,uid=1000,mode=755 \
  npm install --ignore-scripts

RUN npm run build

EXPOSE 8000/tcp

CMD ["npm", "run", "start:prod"]
