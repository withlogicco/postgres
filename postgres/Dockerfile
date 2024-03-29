FROM postgres:16.2 as base


FROM base as primary

COPY ./postgres/primary/docker-entrypoint-initdb.d/ docker-entrypoint-initdb.d/


FROM base as secondary

COPY ./postgres/secondary/bin/ /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint-override.sh" ]

CMD ["postgres"]

FROM primary
