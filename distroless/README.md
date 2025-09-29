Foreldrepenger Distroless baseimage
=====================

Basic Usage
---------------------

```Dockerfile
FROM ghcr.io/navikt/fp-baseimages/distroless:25

LABEL org.opencontainers.image.source=https://github.com/navikt/ft-inntektsmelding

COPY target/classes/logback*.xml conf/
COPY target/lib/*.jar lib/
COPY target/app.jar .
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
ENV LANG='nb_NO.UTF-8' LANGUAGE='nb_NO:nb' LC_ALL='nb:NO.UTF-8' TZ="Europe/Oslo"

ENV JDK_JAVA_OPTIONS="-XX:+PrintCommandLineFlags \
                      -XX:ActiveProcessorCount=2 \
                      -XX:MaxRAMPercentage=75 \
                      -Duser.timezone=Europe/Oslo \
                      -Djava.security.egd=file:/dev/urandom \
                      -Dlogback.configurationFile=conf/logback.xml"
```
and executes
```Dockerfile
CMD ["app.jar"]
```
to start the application.