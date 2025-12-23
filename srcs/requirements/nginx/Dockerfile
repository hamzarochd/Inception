FROM debian:bookworm

RUN apt-get update && apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y && mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/L=Paris/O=42/CN=hrochd.42.fr"

COPY conf/nginx.conf /etc/nginx/nginx.conf

# RUN apt-get clean && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["nginx" , "-g" , "daemon off;"]
