set -ex

POSTGRES_CIDR=${POSTGRES_CIDR:-172.54.32.0/24}
PGDATA=${PGDATA:-/var/lib/postgresql/data}

echo "host replication replicator $POSTGRES_CIDR scram-sha-256" >> $PGDATA/pg_hba.conf
