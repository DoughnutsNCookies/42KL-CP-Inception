#!/bin/sh

if [ -f ./wp-config.php ]
then
	echo "Wordpress has already been installed"
else
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	wp config set WP_REDIS_HOST redis --allow-root
	wp config set WP_REDIS_PORT 6379 --raw --allow-root
	wp config set WP_REDIS_TIMEOUT 1 --raw --allow-root
	wp config set WP_REDIS_READ_TIMEOUT 1 --raw --allow-root
	wp config set WP_REDIS_DATABASE 0 --raw --allow-root
	wp config set WP_CACHE_KEY_SALT $DOMAN_NAME --allow-root
#	wp config set WP_REDIS_CLIENT phpredis --allow-root
	wp plugin install redis-cache --allow-root
	wp plugin update --all --allow-root
	wp plugin activate redis-cache --allow-root
	wp redis enable --allow-root
fi

exec "$@"
