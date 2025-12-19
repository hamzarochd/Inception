FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install mariadb-server -y

COPY scripts/db_script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/db_script.sh

CMD [ "db_script.sh" ]