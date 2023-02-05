FROM		debian:buster
RUN		apt-get update
RUN		apt-get install -y vim wget curl bash php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring redis php-redis ncftp
RUN		rm -rf /var/lib/apt/lists/*
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d
RUN		mkdir /run/php
COPY		./scripts/wp_setup.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/wp_setup.sh
WORKDIR		/var/www/html/
EXPOSE		9000
ENTRYPOINT	["/usr/local/bin/wp_setup.sh"]
CMD		["/usr/sbin/php-fpm7.3", "-F"]
