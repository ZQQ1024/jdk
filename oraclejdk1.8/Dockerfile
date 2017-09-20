FROM centos:node

LABEL maintainer "qiangqiang.zhou@changhong.com"

USER root
ENV JAVA_VERSION=8
ENV JAVA_FOLDER_NAME=jdk1.8.0_144 
ENV JAVA_HOME=/srv/zqq/$JAVA_FOLDER_NAME
ENV JRE_HOME=/srv/zqq/$JAVA_FOLDER_NAME/jre
ENV CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
ENV PATH=$PATH:$JAVA_HOME/bin

COPY java-installer.sh /srv/zqq/
RUN chmod +x /srv/zqq/java-installer.sh && \
chown -R zqq:user_grp /srv/zqq/java-installer.sh

USER zqq

RUN /srv/zqq/java-installer.sh && \
rm /srv/zqq/java-installer.sh

#CMD ["/bin/bash"]   
