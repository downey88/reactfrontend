FROM node:14-alpine AS builder

ENV HOME=/home/app

COPY . $HOME/

WORKDIR $HOME/

RUN npm install --silent --progress=false

RUN npm run build



FROM nginx:1.15.7-alpine AS server

RUN cp $HOME/build/* /usr/share/nginx/html/ -R

COPY --from=builder /$HOME/build/* /usr/share/nginx/html/

EXPOSE 80
