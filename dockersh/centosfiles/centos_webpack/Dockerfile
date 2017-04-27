FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \ 
	&& rm -f /lib/systemd/system/multi-user.target.wants/* \ 
	&& rm -f /etc/systemd/system/*.wants/* \ 
	&& rm -f /lib/systemd/system/local-fs.target.wants/* \ 
	&& rm -f /lib/systemd/system/sockets.target.wants/*udev* \ 
	&& rm -f /lib/systemd/system/sockets.target.wants/*initctl* \ 
	&& rm -f /lib/systemd/system/basic.target.wants/* \ 
	&& rm -f /lib/systemd/system/anaconda.target.wants/* 
RUN yum -y install wget git  
VOLUME [ "/sys/fs/cgroup" ] 
CMD [ "/usr/sbin/init" ]

RUN yum -y install epel-release \
	&& yum -y install nodejs \
	&& npm install -g cnpm \
	&& npm install -g vue-cli \
	&& npm install -g bower \
	&& npm install -g webpack \
    && echo '{"allow_root":true}'>>/root/.bowerrc \
	&& yum clean all
