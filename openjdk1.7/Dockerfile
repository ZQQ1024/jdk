FROM centos:node
LABEL maintainer "qiangqiang.zhou@changhong.com"

WORKDIR /root

RUN yum makecache && \
yum -y install java-1.7.0-openjdk java-1.7.0-openjdk-devel && \
yum clean all

ENV JAVA_VER java-1.7.0-openjdk \ 
JAVA_HOME /usr/lib/jvm/$JAVA_VER \ 
JRE_HOME $JAVA_HOME/jre \ 
CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib \ 
PATH $PATH:$JAVA_HOME/bin

