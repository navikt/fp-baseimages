ARG base_image
FROM navikt/java:common AS java-common
FROM ${base_image:-eclipse-temurin:23-jre}
ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETARCH

RUN echo "I am running on $BUILDPLATFORM, building for $TARGETPLATFORM with $TARGETARCH"  \
    && umask o+r  \
    && groupadd -r --gid 1069 apprunner  \
    && useradd -r --uid 1069 -g apprunner apprunner

COPY --chown=apprunner:root --from=java-common /init-scripts /init-scripts
COPY --chown=apprunner:root --from=java-common /run-java.sh /run-java.sh
COPY --chown=apprunner:root --from=java-common /entrypoint.sh /entrypoint.sh
COPY --chown=apprunner:root --from=java-common /dumb-init /dumb-init
COPY --chown=apprunner:root init-scripts/ /init-scripts
COPY --chown=apprunner:root konfig/konfig-for-${TARGETARCH}.sh /konfig.sh

RUN apt-get update  \
    && apt-get install -y locales

RUN sed -i -e 's/# nb_NO.UTF-8 UTF-8/nb_NO.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LC_ALL="nb_NO.UTF-8"
ENV LANG="nb_NO.UTF-8"
ENV TZ="Europe/Oslo"

# Please see https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV DEFAULT_JVM_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+PrintCommandLineFlags -XX:ActiveProcessorCount=2 -XX:MaxRAMPercentage=75 -Duser.timezone=Europe/Oslo"
ENV APP_BINARY=app
ENV APP_JAR=app.jar
ENV MAIN_CLASS="Main"
ENV CLASSPATH="/app/WEB-INF/classes:/app/WEB-INF/lib/*"

RUN chmod +x konfig.sh  \
    && exec konfig.sh

WORKDIR /app
RUN chown -R apprunner /app

USER apprunner

EXPOSE 8080
ENTRYPOINT ["/dumb-init", "--", "/entrypoint.sh"]
