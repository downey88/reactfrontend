FROM hoosin/alpine-nginx-nodejs:8.14.0

WORKDIR /var/www/html
COPY . /var/www/html/
RUN npm cache clean --force
RUN npm install --silent --progress=false
RUN npm run build

COPY /var/www/html/build/* /usr/share/nginx/html/

EXPOSE 80
