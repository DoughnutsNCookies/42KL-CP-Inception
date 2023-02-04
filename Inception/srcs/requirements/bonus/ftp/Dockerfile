FROM		alpine:3.13
RUN		apk update
RUN		apk upgrade
RUN		apk add --no-cache vsftpd
COPY		conf/vsftpd.conf /tmp/vsftpd.conf
COPY		scripts/ftp_setup.sh /tmp/ftp_setup.sh
#ENTRYPOINT	["sh", "/tmp/ftp_setup.sh"]
CMD		["tail", "-f", "/dev/null"]
