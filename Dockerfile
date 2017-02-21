FROM nginx

RUN \
    chmod 777 /var/cache/nginx && \
    bash -c "if [ -n "${NGINX_PORT}" ]; then sed -ri 's#(listen\s*)[0-9]+#\18080#' /etc/nginx/conf.d/default.conf; fi"
