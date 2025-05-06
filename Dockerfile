FROM ubuntu:latest

# Install required packages
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk wget && \
    apt-get clean

# Download Tomcat
ENV TOMCAT_VERSION 9.0.88
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Extract Tomcat
RUN tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
    mv apache-tomcat-${TOMCAT_VERSION} /opt/tomcat

# Set environment variables
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
WORKDIR /var/lib/jenkins/workspace/pipeline/webapp/target/webapp.war
ADD webapp.war /usr/local/tomcat/webapps/webapp.war
# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
