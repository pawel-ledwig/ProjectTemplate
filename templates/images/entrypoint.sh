#!/bin/bash
# Copyright: Mark Hilton
# Publish in https://github.com/markhilton/docker-nginx-php-fpm under MIT licence

printf "\n\nStarting PHP 7.0 daemon...\n\n"
php-fpm --daemonize

printf "Starting Nginx...\n\n"
set -e

if [[ "$1" == -* ]]; then
    set -- nginx -g daemon off; "$@"
fi

exec "$@"
