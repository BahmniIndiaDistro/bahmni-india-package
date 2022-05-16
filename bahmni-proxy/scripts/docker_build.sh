#!/bin/bash
set -xe

cd bahmni-india-package
#Building Docker images
PROXY_IMAGE_TAG=${BAHMNI_VERSION}-${GITHUB_RUN_NUMBER}
docker build -t bahmniindiadistro/bahmni-proxy-abdm:${PROXY_IMAGE_TAG} -f bahmni-proxy/Dockerfile . --no-cache
