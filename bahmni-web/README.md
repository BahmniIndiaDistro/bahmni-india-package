# Bahmni Web ADBM (bahmniapps) docker image

This directory contains
- Dockerfile to build a bahmni-web image with a abdm specific ui on top of bahmni/bahmni-web base image
- scripts to build a image and publish docker repository 

Running the build script builds bahmniindiadistro/bahmni-web-abdm image

##To build image using scripts

Prerequisite
- default-config and bahmni-india-package should be under same directory. because, it will get the default-config.zip from default-config locally
- ndhm-reat.zip should be placed in bahmni-web/resources
```
cd ..
bahmni-india-package/bahmni-web/scripts/docker_build.sh 
```
##To build image directly using dockerfile

To get the zip file, run the following command
```
sh .github/download_artifact.sh default-config DefaultConfig ${{secrets.GITHUB_TOKEN}} bahmni-web
sh .github/download_artifact.sh ndhm-react NDHMReact ${{secrets.GITHUB_TOKEN}} bahmni-web
```
To build a docker image
```
docker build -t bahmniindiadistro/bahmni-web-abdm -f bahmni-web/docker/Dockerfile . 
```
Note: you can also place zip in bahmni-web/resources