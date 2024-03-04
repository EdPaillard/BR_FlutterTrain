FROM node:14

# RUN apt-get update && \
#     apt-get install mysql-server -y
WORKDIR /usr/src/server
COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x /usr/src/server/waitForDB.sh
EXPOSE 5500

CMD ["node", "index.js"]
