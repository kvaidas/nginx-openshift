FROM nginx:latest

RUN \
    chmod 777 /var/cache/nginx /var/run/ && \
    bash -c "if [ -n "${NGINX_PORT}" ]; then sed -ri 's#(listen\s*)[0-9]+#\18080#' /etc/nginx/conf.d/default.conf; fi" && \
    sed -ri 's#^(\s*root\s*).*#\1/var/www/;#' /etc/nginx/conf.d/default.conf && \
    mkdir -m 777 /var/www &&\
    echo nginx > /var/www/index.html
    
LABEL io.openshift.s2i.scripts-url=image:///usr/local/bin/
COPY ./s2i /usr/local/bin/
WORKDIR /var/www/

# The following is because the image gets built as root and wants to run as root which is forbidden in OpenShift
USER 1001

EXPOSE $NGINX_PORT
