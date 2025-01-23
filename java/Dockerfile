ARG BASE_IMAGE
FROM ${BASE_IMAGE:-eclipse-temurin:23-jre}

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

# Please see https://blogs.oracle.com/java-platform-group/java-se-support-for-docker-cpu-and-memory-limits
ENV DEFAULT_JVM_OPTS="-XX:+UnlockExperimentalVMOptions -XX:+PrintCommandLineFlags -XX:ActiveProcessorCount=2 -XX:MaxRAMPercentage=75 -Duser.timezone=Europe/Oslo"
ENV APP_BINARY=app
ENV APP_JAR=app.jar
ENV MAIN_CLASS="Main"
ENV CLASSPATH="/app/WEB-INF/classes:/app/WEB-INF/lib/*"

WORKDIR /app

USER apprunner

EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]
