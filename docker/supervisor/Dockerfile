ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      supervisor

RUN set -eux; \
    mkdir -p \
        /etc/supervisor; \
    chmod 777 -R \
        /etc/supervisor; \
    chown rootless:rootless -R \
        /etc/supervisor

COPY supervisor /etc/supervisor

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
