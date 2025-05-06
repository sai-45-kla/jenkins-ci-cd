FROM tomcat:latest
MAINTAINER sai

# Copy the packaged war file into tomcat webapps directory
COPY webapp.war .
ADD webapp.war /usr/local/tomcat/webapps/webapp.war

# Expose port 8080
EXPOSE 8082

# Start Tomcat
CMD ["catalina.sh", "run"]


