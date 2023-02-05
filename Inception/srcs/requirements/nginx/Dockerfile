FROM	debian:buster
RUN	apt-get update
RUN	apt-get install -y nginx openssl vim
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -newkey rsa:4096 -keyout /etc/nginx/ssl/schuah.key -out /etc/nginx/ssl/schuah.crt -days 365 -subj "/C=MY/ST=Selangor/L=ShahAlam/O=42KL/OU=schuah/CN=schuah"
COPY	conf/nginx.conf /etc/nginx/nginx.conf
RUN	sed -i 's/ssl_protocols	TLSv1 TLSv1.1 TLSv1.2;/ssl_protocols TLSv1.2 TLSv1.3;/g' /etc/nginx/nginx.conf
RUN	mkdir -p /run/nginx
EXPOSE	443
CMD	["nginx", "-g", "daemon off;"]
