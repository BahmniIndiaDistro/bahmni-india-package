#!/bin/bash
set -e
PROXY_IMAGE_TAG=$(cat bahmni-proxy/.appversion)-${GITHUB_RUN_NUMBER}
echo ${DOCKER_HUB_TOKEN} | docker login -u ${DOCKER_HUB_USERNAME} --password-stdin
echo "[INFO] Pushing build images"
docker push bahmniindiadistro/bahmni-proxy:${PROXY_IMAGE_TAG}

echo "[INFO] Tagging build images as SNAPSHOT Images"
PROXY_SNAPSHOT_IMAGE_TAG=$(cat bahmni-proxy/.appversion)-SNAPSHOT
docker tag bahmniindiadistro/bahmni-proxy:${PROXY_IMAGE_TAG} bahmniindiadistro/bahmni-proxy:${PROXY_SNAPSHOT_IMAGE_TAG}

echo "[INFO] Pushing SNAPSHOT images"
docker push bahmniindiadistro/bahmni-proxy:${PROXY_SNAPSHOT_IMAGE_TAG}

docker logout
