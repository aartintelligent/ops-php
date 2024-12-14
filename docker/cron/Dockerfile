ARG PHP_VERSION=8.4

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

RUN chmod +x /docker/d-*.sh

RUN echo "/docker/d-bootstrap-cron.sh" >> /docker/d-bootstrap.list

ENTRYPOINT ["/docker/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
