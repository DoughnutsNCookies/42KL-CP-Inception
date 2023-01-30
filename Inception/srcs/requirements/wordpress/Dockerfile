FROM		debian:buster
RUN		apt-get update
RUN		apt-get install -y wget curl bash php php-cgi php-mysql php-fpm php-pdo php-gd php-cli php-mbstring redis php-redis
RUN		rm -rf /var/lib/apt/lists/*
RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
COPY		./conf/www.conf /etc/php/8.2/fpm/pool.d
RUN		mkdir /run/php
COPY		./scripts/wp_setup.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/wp_setup.sh
ENTRYPOINT	["/usr/local/bin/wp_setup.sh"]
WORKDIR		/var/www/html/
EXPOSE		9000
CMD		["/usr/sbin/php-fpm8.2", "-F"]
