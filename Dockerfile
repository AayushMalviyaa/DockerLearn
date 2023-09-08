FROM tomcat:11.0-jdk11
COPY ./target/Assignment.war /usr/local/tomcat/webapps/
