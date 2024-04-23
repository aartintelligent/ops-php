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

RUN echo "/d-entrypoint-cron.sh" | tee -a "/d-entrypoint.listing"

RUN chmod +x /d-*.sh

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
