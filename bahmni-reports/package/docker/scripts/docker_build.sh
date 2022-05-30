#!/bin/bash
set -xe

# Build Artifacts copied by CI to bahmni-india-package/bahmni-reports/resources

# Packaging clinic config to embed into default image
# Working directory : clinic-config
cd clinc-config && scripts/package.sh && cd ..
cp clinc-config/target/clinic_config.zip bahmni-india-package/bahmni-reports/resources/

cd bahmni-india-package

# Building Docker images
REPORTS_IMAGE_TAG=$(cat bahmni-reports/.appversion)-${GITHUB_RUN_NUMBER}
docker build -t bahmniindiadistro/reports:${REPORTS_IMAGE_TAG} -f bahmni-reports/docker/Dockerfile  . --no-cache
