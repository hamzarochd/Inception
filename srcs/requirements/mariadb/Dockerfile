FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY scripts/db_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/db_entrypoint.sh

ENTRYPOINT [ "db_entrypoint.sh" ]