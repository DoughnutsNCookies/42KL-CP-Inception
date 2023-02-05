#!/bin/sh

if [ -f "/etc/vsftpd/vsftpd.conf.bak" ]; then
	echo "FTP has already been setup"
else
	mkdir -p /var/www/html
	cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.bak
	mv /tmp/vsftpd.conf /etc/vsftpd/vsftpd.conf
	adduser $FTP_USER --disabled-password
	echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
	chown -R $FTP_USER:$FTP_USER /var/www/html
fi

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
