ARG PHP_VERSION=8.3

FROM php:${PHP_VERSION}-fpm-bookworm

ARG UID=1000
ARG GID=1000

ENV \
PHP_MEMORY_LIMIT="256M" \
PHP_MAX_EXECUTION_TIME="18000" \
PHP_REALPATH_CACHE_SIZE="4096K" \
PHP_REALPATH_CACHE_TTL="600" \
PHP_SENDMAIL_PATH="" \
PHP_XDEBUG__MODE="off" \
PHP_XDEBUG__CLIENT_PORT="9003" \
PHP_XDEBUG__CLIENT_HOST="172.17.0.1" \
PHP_XDEBUG__IDEKEY="PHPSTORM" \
PHP_XDEBUG__IDEKEY="PHPSTORM" \
PHP_SESSION__AUTO_START="0" \
PHP_APC__ENABLE="1" \
PHP_APC__ENABLE_CLI="1" \
PHP_APC__SHM_SIZE="64M" \
PHP_OPCACHE__ENABLE="1" \
PHP_OPCACHE__ENABLE_CLI="1" \
PHP_OPCACHE__MEMORY_CONSUMPTION="256" \
PHP_OPCACHE__INTERNED_STRINGS_BUFFER="8" \
PHP_OPCACHE__MAX_ACCELERATED_FILES="20000" \
PHP_OPCACHE__MAX_WASTED_PERCENTAGE="5" \
PHP_OPCACHE__USE_CWD="1" \
PHP_OPCACHE__VALIDATE_TIMESTAMPS="0" \
PHP_OPCACHE__REVALIDATE_FREQ="0" \
PHP_OPCACHE__REVALIDATE_PATH="0" \
PHP_OPCACHE__SAVE_COMMENTS="1" \
PHP_OPCACHE__RECORDS_WARNING="0" \
PHP_OPCACHE__ENABLE_FILE_OVERRIDE="0" \
PHP_OPCACHE__OPTIMIZATION_LEVEL="0x7FFFBFFF" \
PHP_OPCACHE__DUPS_FIX="0" \
PHP_OPCACHE__BLACKLIST_FILENAME="/etc/php/${PHP_VERSION}/opcache-*.blacklist" \
PHP_OPCACHE__MAX_FILE_SIZE="0" \
PHP_OPCACHE__CONSISTENCY_CHECKS="0" \
PHP_OPCACHE__FORCE_RESTART_TIMEOUT="180" \
PHP_OPCACHE__ERROR_LOG="/var/log/opcache" \
PHP_OPCACHE__LOG_VERBOSITY_LEVEL="1" \
PHP_OPCACHE__PREFERRED_MEMORY_MODEL="" \
PHP_OPCACHE__PROTECT_MEMORY="0" \
PHP_OPCACHE__RESTRICT_API="" \
PHP_OPCACHE__MMAP_BASE="" \
PHP_OPCACHE__CACHE_ID="" \
PHP_OPCACHE__FILE_CACHE="/var/cache/opcache" \
PHP_OPCACHE__FILE_CACHE_ONLY="0" \
PHP_OPCACHE__FILE_CACHE_CONSISTENCY_CHECKS="1" \
PHP_OPCACHE__FILE_CACHE_FALLBACK="1" \
PHP_OPCACHE__HUGE_CODE_PAGE="1" \
PHP_OPCACHE__VALIDATE_PERMISSION="0" \
PHP_OPCACHE__VALIDATE_ROOT="0" \
PHP_OPCACHE__OPT_DEBUG_LEVEL="0" \
PHP_OPCACHE__PRELOAD="" \
PHP_OPCACHE__PRELOAD_USER="rootless" \
PHP_OPCACHE__LOCKFILE_PATH="/var/run/lock/opcache" \
PHP_OPCACHE__JIT="function" \
PHP_OPCACHE__JIT_BUFFER_SIZE="256M" \
FPM_PM__TYPE="static" \
FPM_PM__MAX_CHILDREN="5" \
FPM_PM__START_SERVERS="2" \
FPM_PM__MIN_SPARE_SERVERS="1" \
FPM_PM__MAX_SPARE_SERVERS="3" \
FPM_PM__PROCESS_IDLE_TIMEOUT="60s;" \
FPM_PM__MAX_REQUESTS="512"

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
      iputils-ping unzip curl supervisor

COPY --from=mlocati/php-extension-installer:latest /usr/bin/install-php-extensions /usr/local/bin/install-php-extensions

RUN set -eux; \
    install-php-extensions \
        apcu opcache xdebug gd intl tokenizer xml xsl zip \
        pgsql pdo pdo_pgsql pdo_mysql pdo_sqlite amqp \
        redis

COPY system /

RUN set -eux; \
    touch /etc/environment; \
    mkdir -p \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \ \
        /etc/supervisor \
        /var/www \
        /var/www/public \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log; \
    chmod 777 -R \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \
        /etc/environment \
        /etc/supervisor \
        /var/www \
        /var/www/public \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log; \
    chown rootless:rootless -R \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.d \
        /etc/supervisor \
        /etc/environment \
        /var/www \
        /var/www/public \
        /var/run \
        /var/run/lock \
        /var/lib/php \
        /var/cache \
        /var/log

RUN chmod +x /d-*.sh

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
