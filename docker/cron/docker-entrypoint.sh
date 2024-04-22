#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- cron "$@"
fi

if [ "$1" = 'cron' ]; then
  printenv | tee /etc/environment > /dev/null
fi

exec "$@"