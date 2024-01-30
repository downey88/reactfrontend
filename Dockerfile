FROM node:8.14.1-stretch-slim as build-stage
WORKDIR /home/app
COPY . /home/app
RUN npm install --silent --progress=false
RUN npm run build


FROM nginx:alpine3.18
RUN ls /usr/local
RUN ls /etc/nginx/ && ls /etc

COPY --from=build-stage cp /home/app/build/* /usr/share/nginx/html/ -R

EXPOSE 80
