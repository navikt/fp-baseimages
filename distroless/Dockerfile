ARG DISTROLESS_JAVA_VERSION
FROM gcr.io/distroless/java${DISTROLESS_JAVA_VERSION:-21}-debian12:nonroot
ARG JVM_OPTS

# Healtcheck lokalt/test
COPY --from=busybox:stable-musl /bin/wget /usr/bin/wget

# Working dir for RUN, CMD, ENTRYPOINT, COPY and ADD (required because of nonroot user cannot run commands in root)
WORKDIR /app

ENV LANG='nb_NO.UTF-8' LANGUAGE='nb_NO:nb' LC_ALL='nb:NO.UTF-8' TZ="Europe/Oslo"

ENV JDK_JAVA_OPTIONS="-XX:+PrintCommandLineFlags \
    -XX:ActiveProcessorCount=2 \
    -XX:MaxRAMPercentage=75 \
    -Duser.timezone=Europe/Oslo \
    -Djava.security.egd=file:/dev/urandom \
    -Dlogback.configurationFile=conf/logback.xml \
    ${JVM_OPTS:-}"

CMD ["app.jar"]