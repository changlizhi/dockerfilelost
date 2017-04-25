FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
WORKDIR /app
ENV GO_VERSION=1.8.1
RUN echo 'root:root'|chpasswd\
	&& yum -y install wget \
	&& wget -O $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz \
	&& tar zxvf $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz -C /usr/local \
	&& echo 'export GOROOT=/usr/local/go'>>/etc/profile \
	&& echo 'export GOBIN=$GOROOT/bin'>>/etc/profile \
	&& echo 'export PATH=$PATH:$GOBIN'>>/etc/profile \
	&& echo 'export GOPATH=/app'>>/etc/profile \
	&& source /etc/profile \
	&& rm -f $WORKDIR/go${GO_VERSION}.linux-admin64.tar.gz
