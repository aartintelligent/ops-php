ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    { \
        echo '[global]'; \
        echo 'daemonize = no'; \
        echo; \
        echo '[www]'; \
        echo 'listen = 9000'; \
    } | tee /usr/local/etc/php-fpm.d/zz-docker.conf; \
    sed -i 's/user = www-data/;user = www-data/g' /usr/local/etc/php-fpm.d/docker.conf; \
    sed -i 's/user = www-data/;user = www-data/g' /usr/local/etc/php-fpm.d/www.conf; \
    sed -i 's/group = www-data/;group = www-data/g' /usr/local/etc/php-fpm.d/docker.conf; \
    sed -i 's/group = www-data/;group = www-data/g' /usr/local/etc/php-fpm.d/www.conf

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/www

CMD ["php-fpm"]

USER rootless
