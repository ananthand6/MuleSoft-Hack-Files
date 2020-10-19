FROM java:openjdk-8-jdk

#Add mule runtime in Docker Container

RUN set -x \
        && cd /opt \
        && curl -o mule.zip https://csg10032000deacd929.blob.core.windows.net/mulefile/mule-ee-distribution-standalone-4.3.0.zip \
        && unzip mule.zip \
        && mv mule-enterprise-standalone-4.3.0 mule \
        && rm mule.zip*

VOLUME /opt/mule/apps
VOLUME /opt/mule/logs
VOLUME /opt/mule/domains

#Define environment variables.# Copy  app
COPY neweditedadhack.jar /opt/mule/apps

RUN chmod 777 /opt/mule/apps
# Define working directory.
WORKDIR /opt/mule

# Command to start the application
CMD [ "/opt/mule/bin/mule" ]

# Default http port
EXPOSE 8081
