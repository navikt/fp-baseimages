NODE_VERSIONS = 14 16 18
node_targets = $(addprefix node-, $(NODE_VERSIONS))

TEMURIN_VERSIONS = 17 18 19
temurin_targets = $(addprefix temurin-, $(TEMURIN_VERSIONS))

.PHONY: all $(node_targets) $(temurin_targets)

all: $(node_targets) $(temurin_targets)

$(temurin_targets): temurin-%: java/Dockerfile
	docker pull eclipse-temurin:$(*)-jre
	docker build -t ghcr.io/navikt/fp-baseimages/java:$(*) --build-arg base_image=eclipse-temurin:$(*)-jre java
	docker build -t ghcr.io/navikt/fp-baseimages/java:$(*)-appdynamics --build-arg base_image=eclipse-temurin:$(*)-jre java/appdynamics

$(node_targets): node-%: node-express/Dockerfile node-express
	docker pull node:$(*)-alpine
	docker build -t ghcr.io/navikt/fp-baseimages/node-express:$(*) --build-arg node_version=$(*) node-express
