#!/bin/bash
sleep 9

if [ ! -f /usr/local/bin/wp ]; then
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

cd /var/www/html 

if [ ! -f wp-config.php ]; then
    wp core download --path="/var/www/html" --allow-root
    wp config create \
        --dbname=$DATABASE_NAME \
        --dbuser=$DATABASE_USER \
        --dbpass=$DATABASE_PASSWORD \
        --dbhost=$DATABASE_HOST \
        --allow-root
    wp core install --url=${URL} --title=${TITLE} --admin_user=${ADMIN} --admin_password=${ADMIN_PASSWORD} --admin_email=${EMAILADMINE} --allow-root
    
    wp user create ${USER} ${USER_EMAIL} --role=${USER_ROLE} --user_pass=${USER_PASSWORD} --allow-root
    echo "WordPress installed and User created seccessfully."

else
    echo "WordPress already installed."
fi

exec php-fpm8.2 -F