#! /bin/bash

set -ex

export POSTGRES_PASSWORD=$(cat /run/secrets/postgres-password)
cat /etc/pgpool2/pgpool.conf.tpl | envsubst > /etc/pgpool2/pgpool.conf
cat /etc/pgpool2/pool_passwd.tpl | envsubst > /etc/pgpool2/pool_passwd
unset POSTGRES_PASSWORD

export POSTGRES_PASSWORD_MD5=$(md5sum /run/secrets/postgres-password | awk '{print $1}')
cat /etc/pgpool2/pcp.conf.tpl | envsubst > /etc/pgpool2/pcp.conf
unset POSTGRES_PASSWORD_MD5

exec "$@"
