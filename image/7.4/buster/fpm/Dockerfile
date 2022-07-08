#
# AARTINTELLIGENT
#
# OPS PHP
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
# @see https://github.com/aartintelligent/ops-linux
#
FROM aartintelligent/ops-linux-debian:buster-slim-1.0.0

USER root

RUN set -eux; \
apt-get update \
&& wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - \
&& echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN set -eux; \
apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
php7.4 \
php7.4-cli \
php7.4-fpm \
php7.4-common \
php7.4-bcmath \
php7.4-opcache \
php7.4-apcu \
php7.4-amqp \
php7.4-xdebug \
php7.4-redis \
php7.4-curl \
php7.4-soap \
php7.4-mbstring \
php7.4-mysql \
php7.4-xml \
php7.4-xsl \
php7.4-gd \
php7.4-intl \
php7.4-iconv \
php7.4-ftp \
php7.4-zip

RUN set -eux; \
rm -rf /etc/apt/sources.list.d/*

ENTRYPOINT ["/docker-debian-entrypoint"]

USER debian
