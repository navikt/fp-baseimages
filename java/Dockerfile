ARG BASE_IMAGE
FROM ${BASE_IMAGE:-"europe-north1-docker.pkg.dev/cgr-nav/pull-through/nav.no/jre:openjdk-25-dev"}

ENV TZ="Europe/Oslo"

COPY entrypoint.sh /entrypoint.sh
COPY init-scripts/ /init-scripts

ENV DEFAULT_JVM_OPTS="-XX:+PrintCommandLineFlags \
                      -XX:ActiveProcessorCount=2 \
                      -XX:MaxRAMPercentage=75 \
                      -Djava.security.egd=file:/dev/urandom \
                      -Duser.timezone=Europe/Oslo \
                      -Dlogback.configurationFile=conf/logback.xml"

WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
