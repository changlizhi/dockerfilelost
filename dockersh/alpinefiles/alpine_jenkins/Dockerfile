FROM alpine:3.5

# Install cURL
RUN echo -e "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/main\n\
https://mirror.tuna.tsinghua.edu.cn/alpine/v3.4/community" >> /etc/apk/repositories

RUN apk --update add curl bash openjdk8 ttf-dejavu git gitlab && \
      rm -rf /var/cache/apk/*

# Set environment
ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH ${PATH}:${JAVA_HOME}/bin

RUN mkdir -p /opt

# Set environment
ENV TOMCAT_HOME /opt/tomcat
ENV PATH ${PATH}:${TOMCAT_HOME}/bin

ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]
EXPOSE 8080
#把tomcat 和jenkns都放到当前的目录下面。
RUN mkdir /data/jenkins \
&& cd /data/jenkins \
&& wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war \
&& unzip jenkins.war  -d ROOT \
&& mkdir -p /data/jenkins/logs \
&& mkdir -p /data/jenkins/temp \
&& mkdir -p /data/jenkins/jenkins_data \
&& chcon -Rt svirt_sandbox_file_t /data/jenkins/logs \
&& chcon -Rt svirt_sandbox_file_t /data/jenkins/temp \
&& chcon -Rt svirt_sandbox_file_t /data/jenkins/jenkins_data \
&& chcon -Rt svirt_sandbox_file_t /data/jenkins/ROOT \
