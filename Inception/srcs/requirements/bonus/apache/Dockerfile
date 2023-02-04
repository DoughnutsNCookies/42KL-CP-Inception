FROM	debian:buster
RUN	apt-get update
RUN	apt-get install -y apache2 vim
COPY	./conf/index.html /var/www/html/index.html
EXPOSE	9090
CMD	["apachectl", "-D", "FOREGROUND"]
