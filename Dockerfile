FROM node:20-bookworm-slim AS base2-slim

RUN mkdir ./app
RUN apt update && \
    apt install zip unzip wget git -y
RUN wget https://github.com/Kkbrothers8795/uptime-kuma/archive/refs/tags/V1.23.14.zip
RUN unzip V1.23.14.zip
RUN  mv uptime-kuma-1.23.14/* ./

WORKDIR ./app
COPY . .
RUN npm run setup
EXPOSE 3001:3001
CMD ["node", "server/server.js"]
