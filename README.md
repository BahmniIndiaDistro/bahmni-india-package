# bahmni-india-package

This repository consist of bahmni ABDM dockerization related scripts and files.

To build a image, you need to export `BAHMNI_VERSION` and `GITHUB_RUN_NUMBER`

## Steps to follow for openmrs initializer to load masterdata  [ For Development Purpose ]

Step 1: Latest OpenMRS image is already packaged with openmrs-initializer-module. Make sure you have **openmrs-initializer-module** in modules directory(`/usr/local/tomcat/.Openmrs/modules`). If not **copy or package openmrs-initializer-module** into your openmrs modules.

Step 2: Uncomment `${BAHMNI_CONFIG_PATH:?}` and map it to the source directory of clinic-config.

Step 3: Do the below volume mounts:

In openmrs service

    '${BAHMNI_CONFIG_PATH:?}/:/etc/bahmni_config/' //To configure clinic config changes
    '${BAHMNI_CONFIG_PATH:?}/masterdata/configuration/:/usr/local/tomcat/.OpenMRS/configuration/' //To load master data configuration files

In bahmni-web service

    '${BAHMNI_CONFIG_PATH:?}/:/usr/local/apache2/htdocs/bahmni_config/' //To see clinic configurations changes in bahmni UI
    

Step 4: Make sure we have CSV's with respective folder names inside **masterdata/configuration** folder in **source folder** of **clinic-config**

    configuration/
        ├── addresshierarchy/
        ├── locations/
        ├── privileges/
        ├── roles/

Step 5: Starting up docker would load up openmrs initializer
