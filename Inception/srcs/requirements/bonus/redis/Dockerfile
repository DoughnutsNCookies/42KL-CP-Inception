FROM	debian:buster
RUN	apt-get update
RUN	apt-get install -y redis
RUN	rm -rf /var/lib/apt/lists/*
COPY	./scripts/redis_setup.sh /tmp/redis_setup.sh
EXPOSE	6379
CMD	["sh", "/tmp/redis_setup.sh"]
