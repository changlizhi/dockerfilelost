FROM alpine:3.5
MAINTAINER clz <changlizhi@aliyun.com>
RUN apk add --no-cache bash && \
    apk add --no-cache nodejs && \
    npm  install -g npm && \
    npm  install -g bower && \
    npm  install -g webpack && \
 echo '{"allow_root":true}'>/root/.bowerrc && \
 mkdir /app
WORKDIR /app
CMD ["bash"] 
