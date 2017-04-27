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
	&& apt-get -o Dpkg::Options::=--force-confdef -y install wget locales \
	&& locale-gen en_GB.utf8 en_US.utf8 es_ES.utf8 de_DE.UTF-8 zh_CN.UTF-8 \
	&& chmod -R 777 /var/run /var/log /etc/passwd /etc/group \
	&& mkdir --mode 777 -p /tmp/sockets \
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
	SMTP_RELAYHOST=""
ENTRYPOINT ["/bin/bash"]

