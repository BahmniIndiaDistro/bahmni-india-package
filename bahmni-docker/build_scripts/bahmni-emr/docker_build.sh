#!/bin/bash
set -xe

# Build Artifacts copied by CI to bahmni-india-package/bahmni-emr/resources

# Packaging default config to embed into default image
# Working directory : default-config
cd default-config && scripts/package.sh && cd ..
cp default-config/target/default_config.zip bahmni-india-package/bahmni-emr/resources/

cd bahmni-india-package/bahmni-emr

rm -rf build/
mkdir build/
cd build && mkdir openmrs-modules/ && cd ..

# Copy NDHM OMODS
cp resources/fhir2-omod-1.0.0-SNAPSHOT.omod build/openmrs-modules/
cp resources/hipmodule-omod-0.1-SNAPSHOT.omod build/openmrs-modules/

# Unzipping Default Config
unzip -q -u -d build/default_config resources/default_config.zip

# Building Docker images
OPENMRS_IMAGE_TAG=${BAHMNI_VERSION}-${GITHUB_RUN_NUMBER}
docker build -t bahmni/openmrs:${OPENMRS_IMAGE_TAG} -f docker/Dockerfile  . --no-cache
