FROM bahmni/openmrs:latest

RUN rm /usr/local/tomcat/.OpenMRS/modules/fhir2-1.3.0.omod

COPY build/openmrs-modules/*.omod /usr/local/tomcat/.OpenMRS/modules/
COPY build/default_config /etc/bahmni_config/

