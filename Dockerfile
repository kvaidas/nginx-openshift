FROM nginx

ENV NGINX_PORT=8080

EXEC \
    chmod 777 /var/cache/nginx
