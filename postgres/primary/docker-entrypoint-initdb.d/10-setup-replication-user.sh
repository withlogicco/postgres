set  -ex

REPLICATOR_PASSWORD=$(cat /run/secrets/replicator-password)
psql -c "CREATE ROLE replicator REPLICATION LOGIN PASSWORD '$REPLICATOR_PASSWORD'"