FROM hoosin/alpine-nginx-nodejs:latest

ENV HOME=/home/app

COPY . $HOME/

WORKDIR $HOME/

RUN npm install --silent --progress=false

RUN npm run build

RUN cp $HOME/build/* /usr/share/nginx/html/ -R

EXPOSE 80
