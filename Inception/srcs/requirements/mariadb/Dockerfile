FROM		debian:buster
RUN		apt-get update
RUN		apt-get install -y mariadb-server vim procps
RUN		rm -rf /var/lib/apt/lists/*
RUN		mkdir -p /var/run/mysqld
RUN		mkdir -p /run/mysqld
RUN		chown -R mysql:root /var/run/mysqld
RUN		chown 777 /var/run/mysqld
RUN		chown -R mysql:root /var/lib/mysql
RUN		chown -R mysql:root /run/mysqld
EXPOSE		3306
COPY		tools/mariadb_setup.sh /usr/local/bin/
RUN		chmod +x /usr/local/bin/mariadb_setup.sh
RUN		sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT	["/usr/local/bin/mariadb_setup.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]
