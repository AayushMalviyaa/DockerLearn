FROM tomcat:9.0-jdk11-openjdk
COPY ./target/Assignment.war /usr/local/tomcat/webapps/
