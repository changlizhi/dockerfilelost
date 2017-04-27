FROM ubuntu:16.04
MAINTAINER clz <changlizhi@aliyun.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN mv /etc/apt/sources.list /etc/apt/sources.list.back \
	&& touch /etc/apt/sources.list
RUN echo 'deb-src http://archive.ubuntu.com/ubuntu xenial main restricted'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted'>>/etc/apt/sources.list \
	 && echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted'>>/etc/apt/sources.list \
	 && echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse'>>/etc/apt/sources.list \
	 && echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse'>>/etc/apt/sources.list \
	 && echo 'deb http://archive.canonical.com/ubuntu xenial partner'>>/etc/apt/sources.list \
	 && echo 'deb-src http://archive.canonical.com/ubuntu xenial partner'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted'>>/etc/apt/sources.list \
	 && echo 'deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe'>>/etc/apt/sources.list \
	 && echo 'deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse'>>/etc/apt/sources.list
RUN apt-get -y update \
	&& apt-get -y upgrade \
	&& apt-get -o Dpkg::Options::=--force-confdef -y install wget locales nginx \
	&& locale-gen en_GB.utf8 en_US.utf8 es_ES.utf8 de_DE.UTF-8 zh_CN.UTF-8 \
	&& chmod -R 777 /var/run /var/log /etc/passwd /etc/group \
	&& mkdir --mode 777 -p /tmp/sockets \
	&& sed -i -r -e '/^user www-data;/d' /etc/nginx/nginx.conf \
	&& echo "daemon off;" >> /etc/nginx/nginx.conf \
	&& sed -i -e '/sendfile on;/a\	client_max_body_size 0\;' /etc/nginx/nginx.conf \
	&& sed -i -e 's/gzip on/#gzip on/' /etc/nginx/nginx.conf \
	&& sed -i -e 's/gzip_disable/#gzip_disable/' /etc/nginx/nginx.conf \
	&& rm -rf /etc/nginx/sites-available/* /etc/nginx/sites-enabled/default \
	&& mkdir -p /var/www/html \
	&& chmod 777 /var/www/html /var/lib/nginx \
	&& chmod -R 777 /var/log/nginx \
	&& chmod 755 /var/www \
	&& apt-get -y clean \
	&& rm -rf /var/lib/apt/lists/*
ENV \
	SUPERVISORD_EXIT_ON_FATAL=1 \
	LC_ALL=en_GB.UTF-8 \
	LANG=en_GB.UTF-8 \
	LANGUAGE=en_GB.UTF-8 \
	SMTP_USER="" \
	SMTP_PASS="" \
	SMTP_DOMAIN="" \
	SMTP_RELAYHOST="" \
	DOCUMENT_ROOT=html

EXPOSE 8080 8443
ENTRYPOINT ["/bin/bash"]

