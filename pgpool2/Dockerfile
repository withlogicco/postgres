FROM ubuntu:22.04 AS pgpool

# https://www.pgpool.net/mediawiki/index.php/Apt_Repository

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y wget gnupg
RUN echo "deb http://apt.postgresql.org/pub/repos/apt jammy-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get install -y pgpool2 libpgpool2 postgresql-16-pgpool2
RUN apt-get install -y gettext-base 

COPY pgpool2/ /etc/pgpool2/
COPY bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "pgpool", "-n" ]