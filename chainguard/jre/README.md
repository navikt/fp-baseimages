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

The JVM and GC ergonomics are based on memory limits, not request. Set the request above steady-state reported usage, and limit 25% above the request.
If the application memory limit is well above 1Gi, study the non-heap space usage and consider increasing MaxRAMPercentage to 80-90 or above if there is an over-allocation to non-heap space.


### Standard setup

The working director is sett to `/app`.
```Dockerfile
WORKDIR /app
```

The image sets a set of standard environment variables, selecting G1GC and corresponding GC ergonomics:
```Dockerfile
ENV TZ="Europe/Oslo"

ENV JDK_JAVA_OPTIONS="-XX:+PrintCommandLineFlags \
-XX:ActiveProcessorCount=2 \
-XX:+UseG1GC \
-XX:MaxRAMPercentage=70 \
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