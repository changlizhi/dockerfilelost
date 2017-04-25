FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
RUN echo 'root:root'|chpasswd\
	&& yum -y install wget git \
	&& yum -y install epel-release \
	&& yum -y install nodejs \
	&& npm install -g cnpm \
	&& npm install -g vue-cli \
	&& npm install -g bower \
	&& npm install -g webpack \
    && echo '{"allow_root":true}'>>/root/.bowerrc 
