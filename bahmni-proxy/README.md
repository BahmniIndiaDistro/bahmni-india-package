# Bahmni Proxy ABDM docker image

This directory contains
- Dockerfile to build a proxy image with abdm specific proxypass and rewriteConf on bahmni/proxy base image
- scripts to build a image and publish docker repository

Running the build script builds bahmniindiadistro/bahmni-proxy-abdm image

##To build image using scripts
```
cd ..
bahmni-india-package/bahmni-proxy/scripts/docker_build.sh 
```
##To build image directly using dockerfile

To build a docker image
```
docker build -t bahmniindiadistro/bahmni-proxy-abdm -f bahmni-proxy/Dockerfile . 
```
