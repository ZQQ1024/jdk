FROM centos:node
MAINTAINER ZQQ "qiangqiang.zhou@changhong.com"

RUN groupadd -r user_grp && useradd -r -g user_grp zqq
#RUN chown -R zqq $CATALINA_HOME
USER zqq


WORKDIR /root

ENV JAVA_VER jdk1.7.0_80
ENV JAVA_HOME /usr/lib/jvm/$JAVA_VER
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH $PATH:$JAVA_HOME/bin

ADD jdk-7u80-linux-x64.tar.gz /usr/lib/jvm/
