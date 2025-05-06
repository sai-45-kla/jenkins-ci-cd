FROM ubuntu:latest

# Install required packages
RUN apt-get update
RUN apt-get install maven -y
RUN apt-get install wget -y

# Download Tomcat

RUN mkdir /usr/local/tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.22/bin/apache-tomcat-9.0.22.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.22/ /usr/local/tomcat/
ADD tomcat-users.xml /usr/local/tomcat/conf/
ADD context.xml /usr/local/tomcat/webapps/host-manager/META-INF/
WORKDIR /var/lib/jenkins/workspace/pipeline/webapp/target
ADD webapp.war /usr/local/tomcat/webapps/

EXPOSE 8082
CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]

