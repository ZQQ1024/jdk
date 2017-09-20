FROM centos:node

LABEL maintainer "qiangqiang.zhou@changhong.com"

#添加用户，UID、GID为4001,home的路径为/srv/zqq
RUN groupadd user_grp -g 4001 && \
useradd -u 4001 --home-dir /srv/zqq --create-home --system --no-user-group zqq && \
usermod -g user_grp zqq && \
ln -s /srv/zqq /var/lib/zqq && \
chown -R zqq:user_grp /var/lib/zqq

#建议修改为其他非root目录
WORKDIR /srv/zqq

COPY java-installer.sh .
RUN chmod +x java-installer.sh && \
chown -R zqq:user_grp java-installer.sh

RUN ./java-installer.sh && \
rm java-installer.sh

#设置一个Dockerfile内部使用的变量
ARG JAVA=/srv/zqq/jdk1.8.0_144

#同时设置多个环境变量，相互不可见，使用上面的变量
ENV JAVA_VERSION=8 \ 
JAVA_HOME=$JAVA  \ 
JRE_HOME=$JAVA/jre \ 
CLASSPATH=.:$JAVA/lib:$JAVA/jre/lib \ 
PATH=$PATH:$JAVA/bin

USER zqq

CMD ["/bin/bash"]   
