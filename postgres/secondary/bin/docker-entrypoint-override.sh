#!/usr/bin/env bash

set -ex

if [ ! -f $PGDATA/PG_VERSION ]
then
    echo "Secondary server is not initialized. Starting initialization procedure."
    su postgres -c '10-base-backup.sh'
    su postgres -c '20-enable-standby-mode.sh'
    su postgres -c '30-configure-primary.sh'
    echo "Initialization procedure completed successfully."
else
    echo "Secondary server is already initialized."
fi

exec docker-entrypoint.sh "$@"
