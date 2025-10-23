# Foreldrepenger Baseimage
Base docker image brukt i alle Foreldrepenger apper.

Tilgjengelige images:
* Chainguard OpenJdk JRE 21, 25 ([`chainguard/jre/`](chainguard/jre))

## Bygg lokalt
```shell script
docker build -t jre25:lokal ./chainguard/jre
```
## Hvordan ta i bruk base image

### Java
```dockerfile
FROM ghcr.io/navikt/fp-baseimages/chainguard:jre-25
COPY <path-to-jar> app.jar
```