FROM		debian:buster
RUN		apt-get update
RUN		apt-get install -y mariadb-server mariadb-client vim
RUN		rm -rf /var/lib/apt/lists/*
RUN		mkdir -p /var/run/mysqld
RUN		chown -R mysql:mysql /var/run/mysqld
RUN		chown 777 /var/run/mysqld
EXPOSE		3306
COPY		./conf/mysqld.conf ~/my.cnf
COPY		./conf/mysqld.conf /etc/mysql/my.cnf
COPY		./conf/mysqld.conf /etc/my.cnf
COPY		./scripts/mariadb_setup.sh /usr/local/bin/
COPY		./conf/wordpress.sql /usr/local/bin/
RUN		chmod +x /usr/local/bin/mariadb_setup.sh
RUN		chmod +x /usr/local/bin/wordpress.sql
ENTRYPOINT	["/usr/local/bin/mariadb_setup.sh"]
CMD		["mysqld", "--bind-address=0.0.0.0"]
