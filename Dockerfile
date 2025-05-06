FROM ubuntu
RUN apt-get update -y
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

# Copy configuration files if needed
# COPY ./conf/context.xml /usr/local/apache-tomcat-${TOMCAT_VERSION}/webapps/manager/META-INF/
EXPOSE 8080
CMD ["${CATALINA_HOME}/bin/catalina.sh", "run"]

