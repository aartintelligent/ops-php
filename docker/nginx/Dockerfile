ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      nginx

COPY system /

RUN set -eux; \
    mkdir -p \
        /var/www \
        /var/lib/nginx \
        /etc/nginx; \
    chmod 777 -R \
        /var/www \
        /var/lib/nginx \
        /etc/nginx; \
    chown rootless:rootless -R \
        /var/www \
        /var/lib/nginx \
        /etc/nginx

ENTRYPOINT ["/docker/d-entrypoint.sh"]

WORKDIR /var/www

EXPOSE 8080

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
