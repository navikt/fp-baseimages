# Foreldrepenger baseimage
Base docker images for Foreldrepenger.

Bygger videre på base images fra https://github.com/navikt/baseimages.

Tilgjengelige images:
* Adoptium Temurin LTS 17, 18 og 19 https://adoptium.net/ ([`java`](java))
* Adoptium Temurin LTS 17, 18 og 19 med appdynamics støtte https://adoptium.net/ ([`java/appdynamics`](java/appdynamics))
* Node 14, 16 and 18 with Express 4 ([`node-express`](node-express))

## Bygg lokalt
```shell script
docker build -t java17-appdynamics --build-arg --build-arg base_image=eclipse-temurin:17-jre ./java/appdynamics
docker build -t java18 --build-arg --build-arg base_image=eclipse-temurin:18-jre ./java
```
## Hvordan ta i bruk base image

### Java
```dockerfile
FROM ghcr.io/navikt/fp-baseimages/java:<17|18|19>
COPY <path-to-jar> app.jar
```

## Remote debugging med Java base image

I Java base imagene så er remote debugging skrudd på for port 5005 i development clustrene "dev-fss" og "dev-gcp".
For å kunne remote debugge en kjørende applikasjon så må man først port-forwarde til podden hvor applikasjonen kjører.

```shell script
kubectl port-forward pod/<pod-name> 5005:5005
```

Hvis ikke allerede gjort, opprett en ny configuration i IntelliJ av type "Remote".
Start debuggingen slik som man vanligvis ville gjort lokalt.
