#!/bin/sh
set -e

if [ ! -f "$PHP_INI_DIR/conf.d/zz-php.ini" ]; then

  for e in $(env | grep -o '^PHP_[^=]*'); do

    case "$e" in
      PHP_VERSION|PHP_INI_DIR|PHP_LDFLAGS|PHP_SHA256|PHP_URL|PHP_CFLAGS|PHP_ASC_URL|PHP_CPPFLAGS)
        continue
        ;;
      *)
        VARIABLE=$(echo "$e" \
            | sed -e 's/PHP_/''/g' \
            | sed -e 's/__/'.'/g' \
            | awk '{print tolower($0)}')
        VALUE=$(printenv "$e")
        echo "$VARIABLE = '$VALUE'" >> "/$PHP_INI_DIR/conf.d/zz-php.ini"
      ;;
    esac

  done

  for e in $(env | grep -o '^FPM_[^=]*'); do

    VARIABLE=$(echo "$e" \
        | sed -e 's/FPM_/''/g' \
        | sed -e 's/__/'.'/g' \
        | awk '{print tolower($0)}')
    VALUE=$(printenv "$e")
    echo "$VARIABLE = '$VALUE'" >> "/usr/local/etc/php-fpm.d/zz-docker.conf"

  done

fi

exec "$@"
