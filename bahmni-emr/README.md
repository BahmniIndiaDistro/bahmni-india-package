# Bahmni OpenMRS ABDM (bahmni/openmrs) docker image

This directory contains
- Dockerfile to build a openmrs image with abdm specific omod on top of bahmni/bahmni-emr base image
- scripts to build a image and publish docker repository 

Running the build script builds bahmniindiadistro/bahmni-emr-abdm image

## To build image using scripts

Prerequisite
- default-config and bahmni-india-package should be under same directory. because, it will get the default-config.zip from default-config locally
```
cd ..
bahmni-india-package/bahmni-emr/scripts/docker_build.sh 
```
## To build image directly using dockerfile

To get the zip file, run the following command
```
sh .github/download_artifact.sh default-config DefaultConfig ${{secrets.GITHUB_TOKEN}} bahmni-emr
```
To get the hip and fhir2 omod,
```
sh .github/download_artifact.sh openmrs-module-hip Package ${{secrets.GITHUB_TOKEN}} bahmni-emr
wget -q https://github.com/BahmniIndiaDistro/ndhm-react/releases/download/Release_v1/fhir2-omod-1.0.0-SNAPSHOT.omod -P bahmni-emr/resources/
```
To build a docker image
```
docker build -t bahmniindiadistro/bahmni-emr-abdm -f bahmni-emr/docker/Dockerfile . 
```
Note: you can also place zip and omod in bahmni-emr/resources