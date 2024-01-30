FROM hoosin/alpine-nginx-nodejs:8.14.0 as base
WORKDIR /home/app
COPY . /home/app

# RUN npm install --silent --progress=false
# RUN npm run build

RUN cat /etc/os-release && node -v 
RUN ls /usr/share
RUN ls /etc/nginx/

RUN cp /home/app/build/* /usr/share/nginx/html/ -R

EXPOSE 80
