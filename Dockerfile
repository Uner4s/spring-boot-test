FROM tomcat:8.5-jdk8

ADD target/ROOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "bootRun",  "run"]