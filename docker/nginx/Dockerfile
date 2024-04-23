ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      nginx

RUN set -eux; \
    mkdir -p \
        /var/lib/nginx \
        /etc/nginx; \
    chmod 777 -R \
        /var/lib/nginx \
        /etc/nginx; \
    chown rootless:rootless -R \
        /var/lib/nginx \
        /etc/nginx

COPY system /

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

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
