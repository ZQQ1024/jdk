FROM centos:node
MAINTAINER ZQQ "qiangqiang.zhou@changhong.com"

WORKDIR /root

ENV JAVA_VER jdk1.8.0_144
ENV JAVA_HOME /usr/lib/jvm/$JAVA_VER
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH $PATH:$JAVA_HOME/bin

ADD jdk-8u144-linux-x64.tar.gz /usr/lib/jvm/

