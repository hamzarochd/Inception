FROM debian:bookworm

RUN apt update && apt install -y wget php8.2 php-fpm php-mysql curl

RUN sed -i 's#listen = /run/php/php8.2-fpm.sock#listen = 9000#' /etc/php/8.2/fpm/pool.d/www.conf

RUN chown -R www-data:www-data /var/www/html

COPY tools/wp_entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/wp_entrypoint.sh

ENTRYPOINT ["wp_entrypoint.sh"]