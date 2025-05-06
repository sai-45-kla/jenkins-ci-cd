FROM ubuntu:latest

# Install required packages
RUN apt-get update
RUN apt-get install maven -y
RUN apt-get install wget -y

# Download Tomcat

RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.104/bin/apache-tomcat-9.0.104.tar.gz

# Extract Tomcat
RUN tar -xzvf apache-tomcat-9.0.104.tar.gz

WORKDIR /var/lib/jenkins/workspace/pipeline
ADD /webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war
# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["\usr\local\tomcat\bin\catalina.sh", "run"]
