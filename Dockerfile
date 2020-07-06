# FROM tomcat:8.5-jdk8

# ADD target/ROOT.war /usr/local/tomcat/webapps/

# EXPOSE 8080

# CMD ["catalina.sh", "bootRun",  "run"]

# Only complete flux - local
FROM maven:3.6-jdk-8 AS MAVEN_TOOL_CHAIN

COPY src /tmp/src/

COPY pom.xml /tmp/

COPY buildspec.yml /tmp/

WORKDIR /tmp/

RUN mvn package


FROM tomcat:8.5-jdk8

# Only complete flux - local
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/final-version.war /usr/local/tomcat/webapps/ROOT.war

# Comment this part for complete flux
# This command takes the local file.war
# ADD target/teledoc-app-1.8.0-RELEASE.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh",  "run"]