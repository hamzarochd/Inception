#!/bin/bash

service mariadb start

sleep 2


mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${DATABASE_NAME}\`;"

mysql -u root -e "CREATE USER IF NOT EXISTS '${DATABASE_USER}'@'%' IDENTIFIED BY '${DATABASE_PASSWORD}';"

mysql -u root -e "GRANT ALL PRIVILEGES ON \`${DATABASE_NAME}\`.* TO '${DATABASE_USER}'@'%';"

mysql -u root -e "FLUSH PRIVILEGES;"

service mariadb stop

#
exec mysqld_safe --port=3306 --bind-address=0.0.0.0
