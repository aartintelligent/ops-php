#
# AARTINTELLIGENT
#
# OPS PHP
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
# @see https://github.com/aartintelligent/ops-linux
#
FROM aartintelligent/ops-linux:debian-bullseye-slim-1.0.0

USER root

RUN set -eux; \
apt-get update \
&& wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN set -eux; \
apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
php8.1 \
php8.1-cli \
php8.1-common \
php8.1-bcmath \
php8.1-opcache \
php8.1-apcu \
php8.1-amqp \
php8.1-xdebug \
php8.1-redis \
php8.1-curl \
php8.1-soap \
php8.1-mbstring \
php8.1-mysql \
php8.1-xml \
php8.1-xsl \
php8.1-gd \
php8.1-intl \
php8.1-iconv \
php8.1-ftp \
php8.1-zip

RUN set -eux; \
rm -rf /etc/apt/sources.list.d/*

ENTRYPOINT ["/docker-php-entrypoint"]

USER debian
