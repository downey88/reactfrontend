FROM node:14-alpine AS builder
WORKDIR /var/www/html
COPY . /var/www/html/
RUN npm install --silent --progress=false
RUN npm run build


FROM nginx:1.15.7-alpine AS server
COPY --from=builder /var/www/html/build/* /usr/share/nginx/html/

EXPOSE 80
