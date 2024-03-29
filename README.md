# Postgres with LOGIC

This repository contains the configuration for production-grade Postgres with Docker, with [LOGIC](https://withlogic.co).  It was first presented on 24 January 2024, at Docker Athens during the presentation [Production grade Postgres with Docker](https://www.youtube.com/watch?v=tJegTc-oLtk)[^1].

The configuration in this repository sets up a primary and secondary Postgres server with streaming replication. This means that the primary server accepts all write queries, which are in turn replicated to the secondary server. Therefore, read queries can be load balanced and performed on both servers.

## Requirements

- Docker Engine 25.0.0 or newer
- Docker Compose 2.24.9 or newer, for development

## Configuration

The setup of Postgres with LOGIC is configured with environment variables and Docker Secrets for sensitive data.

### Environment variables

- `POSTGRES_CIDR`: The CIDR block from which to allocate IPs in the Docker network and also allow replication from (default: `172.54.32.0/24`)
- `POSTGRES_GATEWAY`: The gateway to use in the Docker network (default: `172.54.32.254`)
- `POSTGRES_SUBNET`: The subnet to allocate for the Docker network (default: `172.54.0.0/16`)

For convenience, in development these environment variables can be set in a `.env` environment file. Example file available in [`.example.env`](./.example.env)

## Development

To kick off and evaluate the setup locally, all you have to do is run

```console
docker compose up
```

After all containers start, you can validate the setup with the following steps:

1. Create a table on the primary server
    ```console
    docker compose exec primary psql -U postgres -c "CREATE TABLE people (name varchar(40));"
    ```
2. Insert a couple of rows in the primary server
    ```console
    docker compose exec primary psql -U postgres -c "INSERT INTO people VALUES ('grace');"
    docker compose exec primary psql -U postgres -c "INSERT INTO people VALUES ('alan');"
    ```
3. Validate that data can be read from both servers
    ```console
    docker compose exec primary psql -U postgres -c "SELECT * FROM people;"
    docker compose exec secondary psql -U postgres -c "SELECT * FROM people;"
    ```

---

<p align="center">
  <i>🦄 Built with <a href="https://withlogic.co/">LOGIC</a>. 🦄</i>
</p>

[^1]: Presentation on YouTube: https://www.youtube.com/watch?v=tJegTc-oLtk