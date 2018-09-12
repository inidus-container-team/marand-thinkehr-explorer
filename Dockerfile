# Dockerfile for Marand Think!EHR Explorer
FROM tomcat:8-alpine

LABEL org.label-schema.vendor="Marand" \
      org.label-schema.url="http://marand.si/" \
      org.label-schema.name="ThinkEHR Explorer" \
      org.label-schema.version="$EXPLORER_VER" \
      org.label-schema.docker.schema-version="1.0" \
      com.inidus.maintainer="Inidus" \
      com.inidus.contact="Inidus <contact@inidus.com>"

# Think!EHR Explorer
WORKDIR /explorer

# Add war files to tomcat
COPY ./source/*.war /usr/local/tomcat/webapps/

# Add conf files for apps
COPY ./conf/explorer/* /explorer/conf/

EXPOSE 8080

CMD ["catalina.sh", "run"]
