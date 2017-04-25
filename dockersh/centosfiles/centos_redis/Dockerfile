FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
RUN echo 'root:root'|chpasswd \
	&& yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm \
	&& yum -y --enablerepo=remi install redis
