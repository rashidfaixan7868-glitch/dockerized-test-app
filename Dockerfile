FROM node:20

ENV MYSQL_USER=root \
    MYSQL_PASSWORD=qwerty

RUN mkdir -p mysql-testapp

COPY . /mysql-testapp
WORKDIR /mysql-testapp
RUN npm install

CMD ["node","server.js"]

