FROM node:20-bookworm-slim AS base2-slim
RUN mkdir ./app
RUN apt update && \
    apt install zip unzip wget -y
RUN wget https://github.com/Kkbrothers8795/uptime-kuma/archive/refs/tags/V1.23.14.zip
RUN unzip V1.23.14.zip
WORKDIR ./app
COPY . .
RUN cd V1.23.14
RUN npm run setup
EXPOSE 3001:3001
CMD ["node", "server/server.js"]
