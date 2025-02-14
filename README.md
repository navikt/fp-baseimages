# Foreldrepenger baseimage
Base docker images for Foreldrepenger.

Tilgjengelige images:
* Adoptium Temurin 21, 23 https://adoptium.net/ ([`java`](java))
* Distroless 21 ([`distroless`](distroless))

## Bygg lokalt
```shell script
docker build -t java23 --build-arg base_image=eclipse-temurin:23-jre ./java
```
## Hvordan ta i bruk base image

### Java
```dockerfile
FROM ghcr.io/navikt/fp-baseimages/java:<21|23>-nonroot
COPY <path-to-jar> app.jar
```

### Miljø variabler
Imagene legger på følgende miljø variablene om de er montert på riktig sti.

* Hvis `$NAV_TRUSTSTORE_PATH` er satt og keystore finnes.
```shell script
JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH}"
JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
export JAVA_OPTS
```

* Hvis `webproxy: true` i `naiserator.yml`
```shell script
export JAVA_OPTS="${JAVA_OPTS} ${JAVA_PROXY_OPTIONS}"
```
* Importerer føldende database brukere:
```shell script
DEFAULTDS_URL hvis montert under `/var/run/secrets/nais.io/defaultDSconfig/jdbc_url`
DEFAULTDS_USERNAME hvis montert under `/var/run/secrets/nais.io/defaultDS/username`
DEFAULTDS_PASSWORD hvis montert under `/var/run/secrets/nais.io/defaultDS/password`
```

```shell script
DVHDS_URL hvis montert under `/var/run/secrets/nais.io/dvhDSconfig/jdbc_url`
DVHDS_USERNAME hvis montert under `/var/run/secrets/nais.io/dvhDS/username`
DVHDS_PASSWORD hvis montert under `/var/run/secrets/nais.io/dvhDS/password`
```

```shell script
SYSTEMBRUKER_USERNAME hvis montert under `/var/run/secrets/nais.io/serviceuser/username`
SYSTEMBRUKER_PASSWORD hvis montert under `/var/run/secrets/nais.io/serviceuser/password`
```

* Setter opp remote debug om app kjører i dev cluster.
```shell script
export JAVA_OPTS="${JAVA_OPTS} -Xdebug -Xrunjdwp:transport=dt_socket,address=5005,server=y,suspend=n"
```

## Remote debugging med Java base image

I Java base imagene så er remote debugging skrudd på for port 5005 i development clustrene "dev-fss" og "dev-gcp".
For å kunne remote debugge en kjørende applikasjon så må man først port-forwarde til podden hvor applikasjonen kjører.

```shell script
kubectl port-forward pod/<pod-name> 5005:5005
```

Hvis ikke allerede gjort, opprett en ny configuration i IntelliJ av type "Remote".
Start debuggingen slik som man vanligvis ville gjort lokalt.

## Known issues

If you run your java containers on a M4 Apple Silicon Mac on MacOS 15.2, you might run into the SIGKILL error.

To workarround this, you can add the following environment variable to your Dockerfile:

```Dockerfile
ENV JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS} -XX:UseSVE=0"
```