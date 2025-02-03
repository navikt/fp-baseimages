ARG BASE_IMAGE
FROM ${BASE_IMAGE:-"eclipse-temurin:23-jre-alpine"}

RUN umask o+r \
    && addgroup --system --gid 1069 apprunner \
    && adduser --system --uid 1069 -G apprunner apprunner \
    && mkdir -p /app \
    && chown -R apprunner:apprunner /app \
    && apk update \
    && apk add --no-cache musl-locales \
    && sed -i '/nb_NO.UTF-8/s/^# //' /etc/apk/world \
    && echo "export LANG=nb_NO.UTF-8" >> /etc/profile \
    && echo "export LC_ALL=nb_NO.UTF-8" >> /etc/profile

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
