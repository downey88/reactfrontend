FROM node:8.11.0-alpine as build-stage
WORKDIR /home/app
COPY . /home/app
RUN npm install --silent --progress=false
RUN npm run build


FROM nginx:alpine3.18
COPY --from=build-stage /home/app/build/* /usr/share/nginx/html/


EXPOSE 80
