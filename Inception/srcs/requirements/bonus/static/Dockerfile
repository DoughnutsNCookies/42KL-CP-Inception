FROM	debian:buster
RUN	apt-get update
RUN	apt-get install -y nginx vim
COPY	conf/nginx.conf /etc/nginx/nginx.conf
COPY	conf/index.html /var/www/html/index.html
RUN	mkdir -p /run/nginx
EXPOSE	8080
CMD	["nginx", "-g", "daemon off;"]
