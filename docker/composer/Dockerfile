ARG PHP_VERSION=8.4

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

ENV \
COMPOSER_CACHE_DIR="/var/cache/composer" \
COMPOSER_ALLOW_SUPERUSER="1" \
COMPOSER_ALLOW_XDEBUG="0"

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      git tini

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

COPY system /

RUN chmod +x /docker/d-*.sh

ENTRYPOINT ["/docker/d-entrypoint.sh"]

WORKDIR /var/www

USER rootless
