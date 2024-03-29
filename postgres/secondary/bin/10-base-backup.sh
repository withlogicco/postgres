set -ex

export PGPASSWORD=$(cat /run/secrets/replicator-password)

pg_basebackup -w -h primary -D $PGDATA -U replicator -P -v -X stream
chmod -R 0750 $PGDATA
