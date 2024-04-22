ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      supervisor \
      nginx

RUN set -eux; \
    mkdir -p \
        /var/www/public \
        /etc/supervisor \
        /etc/nginx \
        /var/lib/supervisor \
        /var/lib/nginx; \
    chmod 777 -R \
        /var/www/public \
        /etc/supervisor \
        /etc/nginx \
        /var/lib/supervisor \
        /var/lib/nginx; \
    chown rootless:rootless -R \
        /var/www/public \
        /etc/supervisor \
        /etc/nginx \
        /var/lib/supervisor \
        /var/lib/nginx

COPY supervisor /etc/supervisor

COPY nginx /etc/nginx

COPY public /var/www/public

RUN set -eux; \
    { \
        echo '[global]'; \
        echo 'daemonize = no'; \
        echo; \
        echo '[www]'; \
        echo 'listen = /run/php-fpm.sock'; \
    } | tee /usr/local/etc/php-fpm.d/zz-docker.conf; \
    sed -i 's/user = www-data/;user = www-data/g' /usr/local/etc/php-fpm.d/docker.conf; \
    sed -i 's/user = www-data/;user = www-data/g' /usr/local/etc/php-fpm.d/www.conf; \
    sed -i 's/group = www-data/;group = www-data/g' /usr/local/etc/php-fpm.d/docker.conf; \
    sed -i 's/group = www-data/;group = www-data/g' /usr/local/etc/php-fpm.d/www.conf

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/www

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
