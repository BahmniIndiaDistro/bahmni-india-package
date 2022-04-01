#!/bin/bash
set -xe

# Build Artifacts copied by CI to bahmni-india-package/bahmni-emr/resources

# Packaging default config to embed into default image
# Working directory : default-config
cd default-config && scripts/package.sh && cd ..
cp default-config/target/default_config.zip bahmni-india-package/bahmni-emr/resources/

cd bahmni-india-package/bahmni-emr

# Building Docker images
OPENMRS_IMAGE_TAG=${BAHMNI_VERSION}-${GITHUB_RUN_NUMBER}
docker build -t bahmni/openmrs:${OPENMRS_IMAGE_TAG} -f docker/Dockerfile  . --no-cache
