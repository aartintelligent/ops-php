ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

COPY system /

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

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
