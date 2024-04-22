ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

ENV \
COMPOSER_CACHE_DIR="/var/cache/composer" \
COMPOSER_ALLOW_SUPERUSER="1" \
COMPOSER_ALLOW_XDEBUG="0"

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      tini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/www

USER rootless