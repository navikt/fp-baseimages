ARG BASE_IMAGE
FROM ${BASE_IMAGE:-"europe-north1-docker.pkg.dev/cgr-nav/pull-through/nav.no/jre:openjdk-21"}

# Healtcheck lokalt/test
COPY --from=busybox:stable-musl /bin/wget /usr/bin/wget

# Working dir for RUN, CMD, ENTRYPOINT, COPY and ADD (required because of nonroot user cannot run commands in root)
WORKDIR /app

ENV TZ="Europe/Oslo"

ENV JDK_JAVA_OPTIONS="-XX:+PrintCommandLineFlags \
                      -XX:ActiveProcessorCount=2 \
                      -XX:MaxRAMPercentage=75 \
                      -Duser.timezone=Europe/Oslo \
                      -Djava.security.egd=file:/dev/urandom"

ENTRYPOINT ["java", "-jar", "app.jar"]
CMD ["app.jar"]