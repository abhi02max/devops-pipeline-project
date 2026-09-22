# Devops Pipeline Project

A compact CI/CD project demonstrating how a Java/Maven application can be built and packaged with Jenkins and Docker.

## Technology

Java · Maven · Jenkins · Docker

## Repository structure

- `src/` — application source
- `pom.xml` — Maven build configuration
- `Jenkinsfile` — pipeline stages
- `Dockerfile` — container image definition

## Build

```bash
mvn clean package
docker build -t devops-pipeline-project .
```

## Purpose

Created as a DevOps learning exercise covering automated builds, pipeline-as-code, and containerisation.
