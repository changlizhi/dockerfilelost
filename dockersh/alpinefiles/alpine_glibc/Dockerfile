FROM alpine:3.5
MAINTAINER clz <changlizhi@aliyun.com>
ENV GLIBC_PKG_VERSION=2.25-r0
WORKDIR /app
RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main'>>/etc/apk/repositories && apk update
RUN \
	apk add --update openssl \
	&& apk add bash git \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub http://192.168.2.100:8080/dockerfilelost/sgerrand.rsa.pub \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-bin-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-i18n-${GLIBC_PKG_VERSION}.apk \
    && echo 'Y'| apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk \
	&& rm -rf \
		/var/cache/* \
		/var/log/* \
		/var/tmp/* \
	&& mkdir /var/cache/apk
CMD ["/bin/bash"]
