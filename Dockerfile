FROM nginx

ENV NGINX_PORT=8080

RUN \
    chmod 777 /var/cache/nginx
