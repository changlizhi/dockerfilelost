FROM alpine:3.5
MAINTAINER clz <changlizhi@aliyun.com>
ENV GLIBC_PKG_VERSION=2.25-r0
WORKDIR /app
RUN \
	apk add --virtual --no-cache --update ca-certificates openssl \
	&& apk add bash \
		build-base \
		ctags \
		git \
		libx11-dev \
		libxpm-dev \
		libxt-dev \
		make \
		ncurses-dev \
	# Build vim
	&& cd /tmp \
	&& git clone https://github.com/vim/vim \
	&& cd /tmp/vim \
	&& ./configure \
	--disable-gui \
	--disable-netbeans \
	--enable-multibyte \
	--prefix /usr \
	--with-features=big \
	&& make install \
	&& apk add \
		libice \
		libsm \
		libx11 \
		libxt \
		ncurses \
	&& wget -q -O /etc/apk/keys/sgerrand.rsa.pub http://192.168.2.100:8080/dockerfilelost/sgerrand.rsa.pub \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-bin-${GLIBC_PKG_VERSION}.apk \
	&& wget  http://192.168.2.100:8080/dockerfilelost/glibc-i18n-${GLIBC_PKG_VERSION}.apk \
	&&    echo 'Y'| apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk glibc-i18n-${GLIBC_PKG_VERSION}.apk /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 \
	&& rm -rf \
		/var/cache/* \
		/var/log/* \
		/var/tmp/* \
	&& mkdir /var/cache/apk
	
CMD ["/bin/bash"]
