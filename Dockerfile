FROM node:8.14.1-stretch-slim as build-stage
WORKDIR /home/app
COPY . /home/app
RUN npm install --silent --progress=false
RUN npm run build


FROM nginx:alpine3.18
RUN ls /usr/local
RUN cat /etc/nginx/conf.d/default.conf

#COPY --from=build-stage /home/app/build/* /usr/share/nginx/html/

#RUN ls  /usr/share/nginx/html/

EXPOSE 80
