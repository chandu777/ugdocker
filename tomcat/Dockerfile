# docker file for usergrid deployed in tomcat
FROM ca03430/usergrid-base-image:ssh
MAINTAINER chandrakant

RUN groupadd -r usergrid --gid=999 && useradd -r -g usergrid --uid=999 usergrid

ENV JAVA_HOME /usr/lib/jvm/jdk1.8.0_211
ENV TOMCAT_HOME /opt/apache-tomcat-7.0.85

ADD apache-tomcat-7.0.85.tar.gz /opt

RUN rm -rf $TOMCAT_HOME/webapps/*

ADD portal.tar $TOMCAT_HOME/webapps
COPY ROOT.war $TOMCAT_HOME/webapps/
COPY tomcat-entrypoint.sh $TOMCAT_HOME/tomcat-entrypoint.sh
COPY usergrid-deployment.properties $TOMCAT_HOME/lib/
COPY user-creation-script.sh $TOMCAT_HOME/user-creation-script.sh

RUN mv $TOMCAT_HOME/webapps/usergrid-portal.2.0.18 $TOMCAT_HOME/webapps/portal && \
    chown -R usergrid:usergrid $TOMCAT_HOME && \
    chmod 733 -R $TOMCAT_HOME

#chmod 733 /root/user-creation-script.sh && \
#    chmod 733 -R /tomcat && \ 
#    chown -R usergrid:usergrid /tomcat && \
#    chown usergrid:usergrid /root/user-creation-script.sh

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENTRYPOINT ["/opt/apache-tomcat-7.0.85/tomcat-entrypoint.sh"]
CMD ["/usr/bin/supervisord"]

# exposed ports:
#  8080 usergrid http interface
#  8443 usergrid https interface
EXPOSE 8080 8443 22

