
FROM centos:jdk1.8
LABEL maintainer "qiangqiang.zhou@changhong.com"

#不要下载到那些root权限的目录下面,下载不动可以到官网换一个链接
RUN curl -O  http://mirrors.tuna.tsinghua.edu.cn/apache/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz && tar -xf apache-tomcat-8.5.20.tar.gz

ARG tomcat=/srv/zqq/tomcat
ENV CATALINA_HOME=$tomcat \
PATH=$PATH:$tomcat/bin:$tomcat/scripts \
JAVA_OPTS="-Xms512m -Xmx2048m" \
TOMCAT_VER=apache-tomcat-8.5.20


RUN mv apache-tomcat-8.5.20 ${CATALINA_HOME} && chmod +x ${CATALINA_HOME}/bin/*sh

#settings
#去除webapps下面的示例文档和管理入口，只留ROOT
Run rm -rf ${CATALINA_HOME}/webapps/* && \
mkdir -p ${CATALINA_HOME}/webapps/ROOT

USER root

#部署了以个web项目
COPY JDBCTest.war ${CATALINA_HOME}/webapps/

#脚本和安全配置（隐藏版本信息）
COPY scripts/ ${CATALINA_HOME}/scripts/ 
COPY ./settings/conf/* ${CATALINA_HOME}/conf/
COPY ./settings/ServerInfo/ ${CATALINA_HOME}/lib/

RUN chown -R zqq:user_grp ${CATALINA_HOME} && \
chmod +x ${CATALINA_HOME}/scripts/*.sh

#以非root运行tomcat
USER zqq

#检查健康状态
HEALTHCHECK CMD curl --fail http://localhost:8080 || exit 1

EXPOSE 8080 8009
CMD ["tomcat/scripts/tomcat-boot.sh"]

