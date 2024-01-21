FROM hoosin/alpine-nginx-nodejs:latest

WORKDIR /home/app
COPY . /home/app

RUN npm install --silent --progress=false
RUN npm run build
RUN cp /home/app/build/* /usr/share/nginx/html/ -R

EXPOSE 80
