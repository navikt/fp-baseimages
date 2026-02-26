Foreldrepenger Chainguard JRE baseimage
=====================

Basic Usage
---------------------

```Dockerfile
FROM ghcr.io/navikt/fp-baseimages/chainguard:jre-25

LABEL org.opencontainers.image.source=https://github.com/navikt/fp-inntektsmelding

COPY target/classes/logback*.xml conf/
COPY target/lib/*.jar lib/
COPY target/app.jar ./
```

## Customisation

Custom runtime options may be specified using the environment variable `JDK_JAVA_OPTIONS`.

```Dockerfile
ENV JDK_JAVA_OPTIONS="${JDK_JAVA_OPTIONS} -Dlogback.configurationFile=conf/logback.xml"
```

Or by specifying the `JAVA_TOOL_OPTIONS` environment variable in the Dockerfile.


### Standard setup

The working director is sett to `/app`.
```Dockerfile
WORKDIR /app
```

The image sets a set of standard environment variables:
```Dockerfile
ENV TZ="Europe/Oslo"

ENV JDK_JAVA_OPTIONS="-XX:+PrintCommandLineFlags \
-XX:+UseG1GC \
-XX:MaxRAMPercentage=75 \
-Duser.timezone=Europe/Oslo \
-Duser.language=nb \
-Duser.country=NO \
-Djava.security.egd=file:/dev/urandom \
-Dlogback.configurationFile=conf/logback.xml"
```
and executes
```Dockerfile
CMD ["-jar", "app.jar"]
```
to start the application.