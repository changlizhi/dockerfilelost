FROM 192.168.2.103:5000/centos_outsystemd:v1
MAINTAINER clz <changlizhi@aliyun.com>
RUN yum -y install openssh-server;yum clean all; systemctl start sshd;
CMD [ "/usr/sbin/init" ]
