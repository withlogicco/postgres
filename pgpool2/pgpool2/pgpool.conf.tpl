# ----------------------------
# pgPool-II configuration file
# ----------------------------
#
# Docs: https://www.pgpool.net/docs/latest/en/html/configuring-pgpool.html#:~:text=conf%20is%20the%20main%20configuration,%24prefix%2Fetc%2Fpgpool.

#------------------------------------------------------------------------------
# BACKEND CLUSTERING MODE
#------------------------------------------------------------------------------

backend_clustering_mode = 'streaming_replication'


#------------------------------------------------------------------------------
# CONNECTIONS
#------------------------------------------------------------------------------

# - pgpool Connection Settings -

listen_addresses = '*'
port = 5432

# - pgpool Communication Manager Connection Settings -

pcp_listen_addresses = 'localhost'
pcp_port = 9898

# - Backend Connection Settings -

backend_hostname0 = 'primary'
backend_port0 = 5432
backend_weight0 = 1
backend_data_directory0 = '/var/lib/postgresql/data'
backend_flag0 = 'ALLOW_TO_FAILOVER'
backend_application_name0 = 'primary'

backend_hostname1 = 'secondary'
backend_port1 = 5432
backend_weight1 = 1
backend_data_directory1 = '/var/lib/postgresql/data'
backend_flag1 = 'ALLOW_TO_FAILOVER'
backend_application_name1 = 'secondary'

# - Authentication -

enable_pool_hba = on

# - SSL Connections -

#------------------------------------------------------------------------------
# LOGS
#------------------------------------------------------------------------------

# - Where to log -
log_per_node_statement = on


#------------------------------------------------------------------------------
# LOAD BALANCING MODE
#------------------------------------------------------------------------------

load_balance_mode = on


#------------------------------------------------------------------------------
# STREAMING REPLICATION MODE
#------------------------------------------------------------------------------

# - Streaming -

sr_check_period = 2
sr_check_user = 'postgres'
sr_check_password = '${POSTGRES_PASSWORD}'
sr_check_database = 'postgres'


#------------------------------------------------------------------------------
# HEALTH CHECK GLOBAL PARAMETERS
#------------------------------------------------------------------------------

health_check_period = 30
health_check_timeout = 20
health_check_user = 'postgres'
health_check_password = '${POSTGRES_PASSWORD}'
health_check_database = 'postgres'
health_check_max_retries = 3
health_check_retry_delay = 10

#------------------------------------------------------------------------------
# FAILOVER AND FAILBACK
#------------------------------------------------------------------------------
failover_command = 'PGPASSWORD=${POSTGRES_PASSWORD} psql --host secondary -U postgres -c "SELECT pg_promote();"'
failover_on_backend_error = on
failover_on_backend_shutdown = on
detach_false_primary = on

#------------------------------------------------------------------------------
# ONLINE RECOVERY
#------------------------------------------------------------------------------

auto_failback = on
