FROM ubuntu:14.04
MAINTAINER clz <changlizhi@aliyun.com>

RUN \
mv /etc/apt/sources.list /etc/apt/sources.list.back \
	&& touch /etc/apt/sources.list \
	&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse'>>/etc/apt/sources.list \
	&& echo 'APT::Install-Recommends 0;' >> /etc/apt/apt.conf.d/01norecommends \
	&& echo 'APT::Install-Suggests 0;' >> /etc/apt/apt.conf.d/01norecommends \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https

ENV REDIS_USER=redis \
    REDIS_DATA_DIR=/var/lib/redis \
    REDIS_LOG_DIR=/var/log/redis

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y redis-server \
 && sed 's/^daemonize yes/daemonize no/' -i /etc/redis/redis.conf \
 && sed 's/^bind 127.0.0.1/bind 0.0.0.0/' -i /etc/redis/redis.conf \
 && sed 's/^# unixsocket /unixsocket /' -i /etc/redis/redis.conf \
 && sed 's/^# unixsocketperm 755/unixsocketperm 777/' -i /etc/redis/redis.conf \
 && sed '/^logfile/d' -i /etc/redis/redis.conf \
 && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 6379/tcp
VOLUME ["${REDIS_DATA_DIR}"]
ENTRYPOINT ["/sbin/entrypoint.sh"]
