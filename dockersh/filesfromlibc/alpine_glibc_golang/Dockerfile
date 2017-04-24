FROM alpine:3.5
MAINTAINER clz <changlizhi@aliyun.com>
ENV GLIBC_PKG_VERSION=2.25-r0
WORKDIR /app
RUN \
	apk add --update openssl \
	&& apk add bash \
	&& apk add --update go \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub http://192.168.2.100:8080/dockerfilelost/sgerrand.rsa.pub \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-bin-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-i18n-${GLIBC_PKG_VERSION}.apk  \
   && echo 'Y'| apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk glibc-i18n-${GLIBC_PKG_VERSION}.apk /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& rm -rf /var/cache/apk/*
ENV GOPATH /gopath
ENV GOROOT /usr/lib/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin
CMD ["/bin/bash"]
