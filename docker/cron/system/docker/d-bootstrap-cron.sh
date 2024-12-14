#!/bin/sh
set -e

if [ "$1" = 'cron' ]; then
  printenv | tee /etc/environment > /dev/null
fi

exec /d-entrypoint.sh "$@"
