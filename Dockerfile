FROM tomcat:latest
MAINTAINER sai

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the packaged war file into tomcat webapps directory
ADD /root/var/lib/jenkins/workspace/pipeline/webapp/target/webapp.war .
ADD webapp.war /usr/local/tomcat/webapps/webapp.war

# Expose port 8080
EXPOSE 8082

# Start Tomcat
CMD ["catalina.sh", "run"]


