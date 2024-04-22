ARG PHP_VERSION=8.3

FROM php:${PHP_VERSION}-fpm-bookworm

ARG UID=1000
ARG GID=1000

RUN set -eux; \
    groupadd \
      --gid $GID \
      rootless \
    && useradd \
      --uid $UID \
      --gid $GID \
      --shell /bin/bash \
      rootless

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      iputils-ping unzip curl

COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/install-php-extensions

RUN set -eux; \
    install-php-extensions \
        apcu opcache xdebug gd intl mcrypt tokenizer xsl zip \
        pgsql pdo pdo_pgsql pdo_mysql pdo_sqlite \
        redis memcached \
        amqp

RUN set -eux; \
    touch /etc/environment; \
    mkdir -p \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \
        /var/www \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log; \
    chmod 777 -R \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \
        /etc/environment \
        /var/www \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log; \
    chown rootless:rootless -R \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \
        /etc/environment \
        /var/www \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]

WORKDIR /var/www

CMD ["php-fpm"]

USER rootless
