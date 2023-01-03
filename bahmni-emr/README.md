# Bahmni OpenMRS ABDM (bahmni/openmrs) docker image

This directory contains
- Dockerfile to publish Bahmni India distro Openmrs and Bahmni web docker images
- Openmrs and Bahmni Web Helm Charts for India distro

Running the build script builds bahmniindiadistro/bahmni-openmrs image

TODO:
update readme

# Using Profiling tagged Bahmni OpenMRS image

The profiling tagged image of Bahmni OpenMRS comes with YourKit agent packaged which can be pulled from Dockerhub [here](https://hub.docker.com/r/bahmniindiadistro/openmrs/tags?page=1&name=profiling). The following changes have to be made to use YourKit for profiling:-

 
In .env file
 - Set `OPENMRS_IMAGE_TAG=profiling` to pull profiling tagged bahmniindiadistro/openmrs image and
 - Set `OMRS_JAVA_SERVER_OPTS='-agentpath:/etc/profiling/YourKit-JavaProfiler-2022.9/bin/linux-x86-64/libyjpagent.so=port=10001,listen=all'` which will allow YourKit profiler UI to make connection to the agent.  

In docker-compose file
 - Set the value under `ports` as `'10001:10001'` since the port is set to 10001 in the above step.

Follow the steps in this [wiki](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/3125838019/Java+Profiling+using+YourKit) to make connection with the agent using UI replacing the following in step 3:-
 - `Host` &rarr; `localhost`
 - `Port` &rarr; `10001` 
