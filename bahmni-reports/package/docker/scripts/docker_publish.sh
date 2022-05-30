#!/bin/bash
set -e
REPORTS_IMAGE_TAG=$(cat bahmni-emr/.appversion)-${GITHUB_RUN_NUMBER}
echo ${DOCKER_HUB_TOKEN} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin
echo "[INFO] Pushing build images"
docker push bahmniindiadistro/reports:${REPORTS_IMAGE_TAG}

echo "[INFO] Tagging build images as SNAPSHOT Images"
REPORTS_SNAPSHOT_IMAGE_TAG=$(cat bahmni-emr/.appversion)-SNAPSHOT
docker tag bahmniindiadistro/reports:${REPORTS_IMAGE_TAG} bahmniindiadistro/reports:${REPORTS_SNAPSHOT_IMAGE_TAG}

echo "[INFO] Pushing SNAPSHOT images"
docker push bahmniindiadistro/reports:${REPORTS_SNAPSHOT_IMAGE_TAG}

docker logout
