 FROM ubuntu:latest

# Update package list and install dependencies
RUN apt-get update && apt-get -y upgrade

# Install Java (if not already included in the base image)
RUN apt-get install -y openjdk-11-jdk

# Get the latest Tomcat version from the official website
ENV TOMCAT_VERSION=9.0.80
ENV TOMCAT_URL="https://dlcdn.apache.org/tomcat/tomcat-9/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz"

RUN apt-get install -y wget && \
    wget -qO apache-tomcat-${TOMCAT_VERSION}.tar.gz ${TOMCAT_URL} && \
    tar -xzf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /usr/local/ && \
    rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Set Tomcat home and environment variables
ENV CATALINA_HOME=/usr/local/apache-tomcat-${TOMCAT_VERSION}
ENV PATH=$CATALINA_HOME/bin:$PATH

# Expose the Tomcat port
EXPOSE 8080

# Set the startup command
CMD ["${CATALINA_HOME}/bin/catalina.sh", "run"]
