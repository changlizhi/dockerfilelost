FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
VOLUME /sys/fs/cgroup /run /tmp
ENV container=docker
CMD ["/usr/sbin/init"]
RUN echo 'root:root'|chpasswd\
	&& yum -y install wget git \
