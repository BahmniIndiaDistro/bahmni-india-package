#!/bin/bash
set -e
BAHMNI_WEB_IMAGE_TAG=$(cat bahmni-web/.appversion)-${GITHUB_RUN_NUMBER}
echo ${DOCKER_HUB_TOKEN} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin
echo "[INFO] Pushing build images"
docker push bahmniindiadistro/bahmni-web:${BAHMNI_WEB_IMAGE_TAG}

echo "[INFO] Tagging build images as SNAPSHOT Images"
BAHMNI_WEB_SNAPSHOT_IMAGE_TAG=$(cat bahmni-web/.appversion)-SNAPSHOT
docker tag bahmniindiadistro/bahmni-web:${BAHMNI_WEB_IMAGE_TAG} bahmni/bahmni:${BAHMNI_WEB_SNAPSHOT_IMAGE_TAG}

echo "[INFO] Pushing SNAPSHOT images"
docker push bahmniindiadistro/bahmni-web:${BAHMNI_WEB_SNAPSHOT_IMAGE_TAG}

docker logout
