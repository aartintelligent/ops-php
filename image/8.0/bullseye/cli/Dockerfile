#
# AARTINTELLIGENT
#
# OPS PHP
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
# @see https://github.com/aartintelligent/ops-linux
#
FROM aartintelligent/ops-linux-debian:bullseye-slim-1.0.0

USER root

RUN set -eux; \
apt-get update \
&& wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN set -eux; \
apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
php8.0 \
php8.0-cli \
php8.0-common \
php8.0-bcmath \
php8.0-opcache \
php8.0-apcu \
php8.0-amqp \
php8.0-xdebug \
php8.0-redis \
php8.0-curl \
php8.0-soap \
php8.0-mbstring \
php8.0-mysql \
php8.0-xml \
php8.0-xsl \
php8.0-gd \
php8.0-intl \
php8.0-iconv \
php8.0-ftp \
php8.0-zip

RUN set -eux; \
rm -rf /etc/apt/sources.list.d/*

ENTRYPOINT ["/docker-debian-entrypoint"]

USER debian
