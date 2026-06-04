# fp-baseimages

Base Docker images for Team Foreldrepenger backend applications.

## Shared context

- Source of truth for shared domain, architecture, and conventions: `navikt/fp-context`
- Copilot Space: `navikt/TeamForeldrepenger`

## Repo-specific context

| Topic              | Details                                                                                       |
|--------------------|-----------------------------------------------------------------------------------------------|
| Role               | Provides the shared Chainguard-based JRE images used in backend Dockerfiles                   |
| Published tags     | `jre-25`, `jre-26`, `latest`                                                                  |
| Consumers          | Foreldrepenger backend application images                                                     |
| Special constraint | Distroless and minimal base images; do not assume shell tools or extra packages are available |

## Verification

- Verify by building the specific base image you changed.
