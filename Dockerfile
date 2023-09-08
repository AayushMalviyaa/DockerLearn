FROM tomcat:9.0-jdk11-openjdk
COPY ./target/ROOT.war /usr/local/tomcat/webapps/
EXPOSE 8080
