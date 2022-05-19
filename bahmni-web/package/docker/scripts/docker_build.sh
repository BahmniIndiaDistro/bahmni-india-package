#!/bin/bash
set -xe

#Working directory : clinic-config
cd clinic-config && scripts/package.sh && cd ..
cp clinic-config/target/clinic_config.zip bahmni-india-package/bahmni-web/resources/

cd bahmni-india-package

#Building Docker images
BAHMNI_WEB_IMAGE_TAG=$(cat bahmni-web/.appversion)-${GITHUB_RUN_NUMBER}
docker build -t bahmniindiadistro/bahmni-web:${BAHMNI_WEB_IMAGE_TAG} -f bahmni-web/docker/Dockerfile  . --no-cache
