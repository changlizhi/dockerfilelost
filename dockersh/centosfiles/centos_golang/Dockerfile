FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
WORKDIR /app
ENV GO_VERSION=1.8.1
ENV container docker
VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/usr/sbin/init" ]
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
	&& rm -f /lib/systemd/system/multi-user.target.wants/*\
	&& rm -f /etc/systemd/system/*.wants/* \
	&& rm -f /lib/systemd/system/local-fs.target.wants/* \
	&& rm -f /lib/systemd/system/sockets.target.wants/*udev* \
	&& rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
	&& rm -f /lib/systemd/system/basic.target.wants/*\
	&& rm -f /lib/systemd/system/anaconda.target.wants/*
RUN yum -y install wget git \
	&&	yum clean all\
	&&	wget -O $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz \
	&&	tar zxvf $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz -C /usr/local \
	&&	echo 'export GOROOT=/usr/local/go'>>/etc/profile \
	&&	echo 'export GOBIN=$GOROOT/bin'>>/etc/profile \
	&&	echo 'export PATH=$PATH:$GOBIN'>>/etc/profile \
	&&	echo 'export GOPATH=/app'>>/etc/profile \
	&&	source /etc/profile \
	&&	rm -f $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz
