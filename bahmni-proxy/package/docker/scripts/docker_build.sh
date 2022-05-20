#!/bin/bash
set -xe

cd bahmni-india-package
#Building Docker images
PROXY_IMAGE_TAG=$(cat bahmni-proxy/.appversion)-${GITHUB_RUN_NUMBER}
docker build -t bahmniindiadistro/bahmni-proxy:${PROXY_IMAGE_TAG} -f bahmni-proxy/package/docker/Dockerfile . --no-cache
