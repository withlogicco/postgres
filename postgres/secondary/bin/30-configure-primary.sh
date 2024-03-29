set  -ex

pg_ctl -w start
REPLICATOR_PASSWORD=$(cat /run/secrets/replicator-password)
psql -c "ALTER SYSTEM SET primary_conninfo = 'host=primary port=5432 user=replicator password=$REPLICATOR_PASSWORD application_name=secondary';"
pg_ctl -w stop
