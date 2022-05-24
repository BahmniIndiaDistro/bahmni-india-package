#!/bin/bash
set -e
OPENMRS_IMAGE_TAG=$(cat bahmni-emr/.appversion)-${GITHUB_RUN_NUMBER}
echo ${DOCKER_HUB_TOKEN} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin
echo "[INFO] Pushing build images"
docker push bahmniindiadistro/bahmni-openmrs:${OPENMRS_IMAGE_TAG}

echo "[INFO] Tagging build images as SNAPSHOT Images"
OPENMRS_SNAPSHOT_IMAGE_TAG=$(cat bahmni-emr/.appversion)-SNAPSHOT
docker tag bahmniindiadistro/bahmni-openmrs:${OPENMRS_IMAGE_TAG} bahmniindiadistro/bahmni-openmrs:${OPENMRS_SNAPSHOT_IMAGE_TAG}

echo "[INFO] Pushing SNAPSHOT images"
docker push bahmniindiadistro/bahmni-openmrs:${OPENMRS_SNAPSHOT_IMAGE_TAG}

docker logout
