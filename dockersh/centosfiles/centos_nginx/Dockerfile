FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
RUN echo 'root:root'|chpasswd\
	&& yum -y install wget git \
	&& rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm \
	&& yum -y install nginx
