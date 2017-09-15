FROM centos:node
MAINTAINER ZQQ "qiangqiang.zhou@changhong.com"
WORKDIR /root
RUN yum makecache && \
yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
yum clean all

ENV JAVA_VER java-1.8.0-openjdk
ENV JAVA_HOME /usr/lib/jvm/$JAVA_VER
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH $PATH:$JAVA_HOME/bin

