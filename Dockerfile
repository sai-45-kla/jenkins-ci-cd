FROM tomcat:latest
MAINTAINER sai

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the packaged war file into tomcat webapps directory
COPY /var/lib/jenkins/workspace/pipeline/webapp .
ADD webapp/target/webapp.war /usr/local/tomcat/webapps/webapp.war

# Expose port 8080
EXPOSE 8082

# Start Tomcat
CMD ["catalina.sh", "run"]


