#!/bin/bash
set -xe

#Working directory : default-config
cd default-config && scripts/package.sh && cd ..
cp default-config/target/default_config.zip bahmni-india-package/bahmni-web/resources/

cd bahmni-india-package/bahmni-web

#Building Docker images
BAHMNI_WEB_IMAGE_TAG=${BAHMNI_VERSION}-${GITHUB_RUN_NUMBER}
docker build -t bahmni/bahmni-web:${BAHMNI_WEB_IMAGE_TAG} -f docker/Dockerfile  . --no-cache
