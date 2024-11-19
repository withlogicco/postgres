FROM postgres:16.2 AS base


FROM base AS primary

COPY ./primary/docker-entrypoint-initdb.d/ docker-entrypoint-initdb.d/


FROM base AS secondary

COPY ./secondary/bin/ /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint-override.sh" ]

CMD ["postgres"]

FROM primary
