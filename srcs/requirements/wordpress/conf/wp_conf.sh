#!/bin/bash

cd /var/www/html
if [ ! -f "./wp-config.php" ];
then
	echo "Wordpress not installed cleaning up"
	rm -rf /var/www/html/*

	echo "Installing Wordpress"
	wp core download --allow-root

	echo "Configuring Wordpress"
	wp config create --allow-root \
				--dbname=$DB_NAME \
				--dbuser=$DB_USER \
				--dbpass=$DB_PASS \
				--dbhost=mariadb:3306

	echo "Installing Wordpress"
	wp core install --allow-root \
					--url="tdutel.42.fr" \
					--title="Inception Project" \
					--admin_user="$WP_ADMIN_USER" \
					--admin_password="$WP_ADMIN_PASS" \
					--admin_email="$WP_ADMIN_MAIL"

	echo "Creating Base User"
	wp user create "$WP_BASE_USER" "$WP_BASE_EMAIL" --user_pass="$WP_BASE_PASS" --allow-root \

fi
echo "Starting Wordpress"
exec "$@"
