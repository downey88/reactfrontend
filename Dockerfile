FROM node:14-alpine AS builder
WORKDIR /var/www/html
COPY . /var/www/html/
RUN npm install --silent --progress=false
RUN npm run build


FROM nginx:1.15.7-alpine AS server
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/main libuv \
    && apk add --no-cache --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/main nodejs=14.17.1-r0 npm=7.17.0-r0 \
    && apk add --no-cache --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/community yarn=1.22.10-r0
COPY --from=builder /var/www/html/build/* /usr/share/nginx/html/

EXPOSE 80
