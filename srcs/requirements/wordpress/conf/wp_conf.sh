#!/bin/bash

cd /var/www/html
if [ ! -f "./wp-config.php" ];
then
	sleep 10
	wp core download --allow-root

	wp config create	--allow-root \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASS \
				--dbhost=mariadb:3306

	wp db create --allow-root
	
	wp core install --allow-root \
					--url="tdutel.42.fr" \
					--title="Inception Project" \
					--admin_user="$WP_ADMIN_USER" \
					--admin_password="$WP_ADMIN_PASS" \
					--admin_email="$WP_ADMIN_MAIL"

	wp user create "$WP_BASE_USER" "$WP_BASE_EMAIL" --allow-root \

fi

mkdir -p /run/php/
php-fpm7.4 -F
