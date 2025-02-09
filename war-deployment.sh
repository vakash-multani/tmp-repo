#!/bin/bash
chmod 777 springboot-0.0.1-SNAPSHOT.war
rm -r /opt/tomcat/webapps/ROOT/*
rm -r /opt/tomcat/springboot-war/*
#cp -R /home/dev/springboot/springboot-0.0.1-SNAPSHOT.war /opt/tomcat/springboot-war/
#cp -R /root/springboot-0.0.1-SNAPSHOT.war /opt/tomcat/springboot-war/
unzip /home/dev/springboot/springboot-0.0.1-SNAPSHOT.war -d /opt/tomcat/webapps/ROOT