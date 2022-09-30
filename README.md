# bahmni-india-package

This repository consist of bahmni ABDM dockerization related scripts and files.

To build a image, you need to export `BAHMNI_VERSION` and `GITHUB_RUN_NUMBER`

## Steps to follow for openmrs initializer to load masterdata  [ For Development Purpose ]

Step 1: Latest OpenMRS image is already packaged with openmrs-initializer-module. Make sure you have **openmrs-initializer-module** in modules directory(`/usr/local/tomcat/.Openmrs/modules`). If not **copy or package openmrs-initializer-module** into your openmrs modules.

Step 2: Follow the steps [here](https://github.com/Bahmni/bahmni-package/tree/master/bahmni-docker#local-development-on-config) to volume mount your local folder.
    

Step 4: Make sure we have CSV's with respective folder names inside **masterdata/configuration** folder in **source folder** of **clinic-config**

    configuration/
        ├── addresshierarchy/
        ├── locations/
        ├── privileges/
        ├── roles/

Step 5: Starting up docker would load up openmrs initializer
Step 6: On every change in masterdata folder of clinic-config restart openmrs service by running `docker-compose restart openmrs`
