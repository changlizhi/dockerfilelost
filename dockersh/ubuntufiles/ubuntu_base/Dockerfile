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
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y vim.tiny wget sudo net-tools ca-certificates unzip apt-transport-https \
	&& rm -rf /var/lib/apt/lists/*


