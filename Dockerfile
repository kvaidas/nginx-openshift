FROM nginx:latest

RUN \
    chmod 777 /var/cache/nginx /var/run/ && \
    bash -c "if [ -n "${NGINX_PORT}" ]; then sed -ri 's#(listen\s*)[0-9]+#\18080#' /etc/nginx/conf.d/default.conf; fi" && \
    sed -ri 's#^(\s*root\s*).*#\1/var/www/;#' /etc/nginx/conf.d/default.conf && \
    mkdir -m 777 /var/www &&\
    echo nginx > /var/www/index.html

EXPOSE $NGINX_PORT
