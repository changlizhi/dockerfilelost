FROM centos:7
MAINTAINER clz <changlizhi@aliyun.com>
ENV JAVA_VERSION=8 \
	JAVA_UPDATE=121 \
	JAVA_BUILD=13 \
	JAVA_PATH=e9e7ea248e2c4826b92b3f075a80e441 \
	JAVA_HOME_PRE=/usr/lib/jdk \ 
	JAVA_HOME_SUR=default-jdk \
	JAVA_SECURE=jre/lib/security \
	LN=/usr/bin/
ENV JAVA_HOME=$JAVA_HOME_PRE/$JAVA_HOME_SUR \
	ORACLE_WEB=http://download.oracle.com/otn-pub/java \
	COOKIE=oraclelicense=accept-securebackup-cookie
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD [ "/usr/sbin/init" ]
RUN yum install -y wget ca-certificates unzip ;\
	cd /tmp ;\
	wget --header "Cookie: ${COOKIE};" ${ORACLE_WEB}/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/${JAVA_PATH}/jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz ;\
	tar -xzf jdk-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz ;\
	mkdir -p ${JAVA_HOME_PRE} ;\
	mv jdk1.${JAVA_VERSION}.0_${JAVA_UPDATE} ${JAVA_HOME_PRE}/java-${JAVA_VERSION}-oracle ;\
	ln -s java-${JAVA_VERSION}-oracle ${JAVA_HOME} ;\
	ln -s ${JAVA_HOME}/bin/* ${LN} ;\
	rm -rf ${JAVA_HOME}/*src.zip ;\
	wget --header "Cookie: ${COOKIE};" ${ORACLE_WEB}/jce/${JAVA_VERSION}/jce_policy-${JAVA_VERSION}.zip ;\
	unzip -jo -d ${JAVA_HOME}/${JAVA_SECURE} jce_policy-${JAVA_VERSION}.zip ;\
	rm ${JAVA_HOME}/${JAVA_SECURE}/README.txt ;\
	rm /tmp/* ;\
	echo 'export JAVA_HOME=/usr/lib/jdk/default-jdk'>>/etc/profile ;\
	source /etc/profile;
