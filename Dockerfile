FROM node:22-alpine AS builder


WORKDIR /mydir

COPY package*.json ./

RUN npm install

COPY . /mydir

RUN npm run build


FROM nginx:alpine AS runtime


RUN addgroup -S appgroup && \
    adduser -S appuser -G appgroup

RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf && \
    sed -i 's/listen  \[::\]:80;/listen  [::]:8080;/' /etc/nginx/conf.d/default.conf

COPY --from=builder /mydir/build/ /usr/share/nginx/html/

RUN chown -R appuser:appgroup /usr/share/nginx/html && \
    chown -R appuser:appgroup /var/cache/nginx && \
    chown -R appuser:appgroup /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown appuser:appgroup /var/run/nginx.pid

RUN mkdir -p /tmp/nginx/client_temp \
             /tmp/nginx/proxy_temp \
             /tmp/nginx/fastcgi_temp \
             /tmp/nginx/uwsgi_temp \
             /tmp/nginx/scgi_temp && \
    chown -R appuser:appgroup /tmp/nginx

USER appuser

EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]
