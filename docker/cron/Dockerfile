ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

RUN set -eux; \
    apt-get update \
    && apt-get install -y --no-install-recommends \
      cron

COPY system /

RUN chmod 0644 /etc/cron.d/crontab

RUN crontab -u rootless /etc/cron.d/crontab

RUN chmod gu+s /usr/sbin/cron

RUN chmod +x /d-*.sh

ENTRYPOINT ["/d-entrypoint-cron.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
