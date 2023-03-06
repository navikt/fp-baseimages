# Foreldrepenger baseimage
Base docker images for Foreldrepenger.

Bygger videre på base images fra https://github.com/navikt/baseimages.

Tilgjengelige images:
* Adoptium Temurin LTS 17 og 19 https://adoptium.net/ ([`java`](java))
* Adoptium Temurin LTS 17 og 19 med appdynamics støtte https://adoptium.net/ ([`java/appdynamics`](java/appdynamics))

## Bygg lokalt
```shell script
docker build -t java17-appdynamics --build-arg --build-arg base_image=eclipse-temurin:17-jre ./java/appdynamics
docker build -t java19 --build-arg --build-arg base_image=eclipse-temurin:19-jre ./java
```
## Hvordan ta i bruk base image

### Java
```dockerfile
FROM ghcr.io/navikt/fp-baseimages/java:<17|18|19>
COPY <path-to-jar> app.jar
```

### Miljø variabler
Imagene legger på følgende miljø variablene om de er montert på riktig sti.

* Hvis `$NAV_TRUSTSTORE_PATH` er satt og keystore ikke er korrupt.
```shell script
JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStore=${NAV_TRUSTSTORE_PATH}"
JAVA_OPTS="${JAVA_OPTS} -Djavax.net.ssl.trustStorePassword=${NAV_TRUSTSTORE_PASSWORD}"
export JAVA_OPTS
```

* Hvis `webproxy: true` i `naiserator.yml`
```shell script
export JAVA_OPTS="${JAVA_OPTS} ${JAVA_PROXY_OPTIONS}"
```

* Alle variabler definert som app properties i vault montert under `/var/run/secrets/nais.io/vault/*.env`

* Konfigurerer appdynamics klienten om `/opt/appdynamics/javaagent.jar` finnes.

* Importerer alle konfigurasjonsvariabler til appdynamics montert under `/var/run/secrets/nais.io/appdynamics/*.env`

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
FPINFOSCHEMA_URL hvis montert under `/var/run/secrets/nais.io/fpinfoSchemaConfig/jdbc_url`
FPINFOSCHEMA_USERNAME hvis montert under `/var/run/secrets/nais.io/fpinfoSchema/username`
FPINFOSCHEMA_PASSWORD hvis montert under `/var/run/secrets/nais.io/fpinfoSchema/password`
```

```shell script
SYSTEMBRUKER_USERNAME hvis montert under `/var/run/secrets/nais.io/serviceuser/username`
SYSTEMBRUKER_PASSWORD hvis montert under `/var/run/secrets/nais.io/serviceuser/password`
```

```shell script
LDAP_USERNAME hvis montert under `/var/run/secrets/nais.io/ldap/username`
LDAP_PASSWORD hvis montert under `/var/run/secrets/nais.io/ldap/password`
```

```shell script
MQ_USERNAME hvis montert under `/var/run/secrets/nais.io/mq/username`
MQ_PASSWORD hvis montert under `/var/run/secrets/nais.io/mq/password`
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
