ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

COPY system /

RUN set -eux; \
    mkdir -p \
        /var/www; \
    chmod 777 -R \
        /var/www; \
    chown rootless:rootless -R \
        /var/www

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

EXPOSE 9000

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
