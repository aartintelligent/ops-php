ARG PHP_VERSION=8.3

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

COPY system /

ENTRYPOINT ["/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
