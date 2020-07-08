FROM maven:3.6-jdk-8 AS MAVEN_TOOL_CHAIN

COPY src /tmp/src/

COPY pom.xml /tmp/

COPY buildspec.yaml /tmp/

WORKDIR /tmp/

RUN mvn clean

RUN mvn package


FROM tomcat:8.5-jdk8

COPY --from=MAVEN_TOOL_CHAIN /tmp/target/final-version.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh",  "run"]