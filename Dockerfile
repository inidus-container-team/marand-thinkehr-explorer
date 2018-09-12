# Dockerfile for Marand Think!EHR Explorer
FROM tomcat:8-alpine

LABEL org.label-schema.vendor="Marand" \
      org.label-schema.url="http://marand.si/" \
      org.label-schema.name="ThinkEHR Explorer" \
      org.label-schema.version="$EXPLORER_VER" \
      org.label-schema.docker.schema-version="1.0" \
      com.inidus.maintainer="Inidus" \
      com.inidus.contact="Inidus <contact@inidus.com>"

# Set ENV for container
ENV EHR_EXPLORER4_APPHOME=/explorer

# Think!EHR Explorer
WORKDIR $EHR_EXPLORER4_APPHOME

# Add war files to tomcat
COPY ./source/*.war /usr/local/tomcat/webapps/

# Add conf files for apps
COPY ./conf/explorer/* /conf/
COPY ./conf/ehrscape-manager/ehrscape-manager.properties /usr/local/tomcat/conf/ehrscape-manager.properties

EXPOSE 8080

CMD ["catalina.sh", "run"]
