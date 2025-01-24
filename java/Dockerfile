ARG BASE_IMAGE
FROM ${BASE_IMAGE:-"eclipse-temurin:23-jre"}

RUN umask o+r \
    && groupadd -r --gid 1069 apprunner \
    && useradd -r --uid 1069 -g apprunner apprunner \
    && mkdir -p /app \
    && chown -R apprunner /app \
    && apt-get update  \
    && apt-get install -y locales \
    && apt-get clean \
    && sed -i -e 's/# nb_NO.UTF-8 UTF-8/nb_NO.UTF-8 UTF-8/' /etc/locale.gen \
    && locale-gen

ENV LANG='nb_NO.UTF-8' LANGUAGE='nb_NO:nb' LC_ALL='nb_NO.UTF-8' TZ="Europe/Oslo"

COPY --chown=apprunner:root entrypoint.sh /entrypoint.sh
COPY --chown=apprunner:root init-scripts/ /init-scripts

ENV DEFAULT_JVM_OPTS="-XX:+PrintCommandLineFlags \
                      -XX:ActiveProcessorCount=2 \
                      -XX:MaxRAMPercentage=75 \
                      -Djava.security.egd=file:/dev/urandom \
                      -Duser.timezone=Europe/Oslo \
                      -Dlogback.configurationFile=conf/logback.xml"

WORKDIR /app
USER apprunner
EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
