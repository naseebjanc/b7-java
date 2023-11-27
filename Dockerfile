# Use an official Tomcat runtime as the base image
FROM tomcat:9.0-jdk11-openjdk-slim


# Copy the amazon.war file into the webapps directory of Tomcat
COPY ./Amazon.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]

