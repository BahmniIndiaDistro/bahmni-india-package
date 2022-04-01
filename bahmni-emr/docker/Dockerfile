FROM bahmni/openmrs:latest

RUN rm /usr/local/tomcat/.OpenMRS/modules/fhir2-1.3.0.omod

ADD resources/default_config.zip /tmp/artifacts/
RUN unzip -f -d /etc/bahmni_config/ /tmp/artifacts/default_config.zip

COPY resources/*.omod /usr/local/tomcat/.OpenMRS/modules/

RUN rm -rf /tmp/artifacts

