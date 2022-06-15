FROM bahmni/openmrs:latest

RUN rm -f /usr/local/tomcat/.OpenMRS/modules/fhir2-1.3.0.omod

ADD bahmni-emr/resources/clinic_config.zip /tmp/artifacts/
RUN rm -rf /etc/bahmni_config
RUN unzip -u -d /etc/bahmni_config /tmp/artifacts/clinic_config.zip

COPY bahmni-emr/resources/*.omod /usr/local/tomcat/.OpenMRS/modules/

RUN rm -rf /tmp/artifacts

