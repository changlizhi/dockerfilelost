FROM alpine:3.5
MAINTAINER clz <changlizhi@aliyun.com>
ENV GLIBC_PKG_VERSION=2.25-r0
WORKDIR /app
RUN echo 'http://mirrors.ustc.edu.cn/alpine/v3.5/main'>/etc/apk/repositories && apk update
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
	&& apk add nodejs \
	&& npm install -g npm \
	&& npm install -g webpack \
	&& npm install -g bower \
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
	&&    echo 'Y'| apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk \
	&& echo '{"allow_root":true}'>/root/.bowerrc \
	&& rm -rf \
		/var/cache/* \
		/var/log/* \
		/var/tmp/* \
	&& mkdir /var/cache/apk
	
CMD ["/bin/bash"]
