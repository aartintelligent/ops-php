ARG PHP_VERSION=8.4

FROM aartintelligent/php:${PHP_VERSION}-base

USER root

COPY system /

ENTRYPOINT ["/docker/d-entrypoint.sh"]

WORKDIR /var/www

STOPSIGNAL SIGQUIT

CMD ["supervisord"]

USER rootless
