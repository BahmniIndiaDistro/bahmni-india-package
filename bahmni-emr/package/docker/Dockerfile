FROM bahmni/openmrs:latest@sha256:f98b5a6e9412a4151a65ee4d6cbf43e7a8aa8fb4d93c434feb1c3e99c74af957

RUN rm /usr/local/tomcat/.OpenMRS/modules/fhir2-1.3.0.omod

ADD bahmni-emr/resources/clinic_config.zip /tmp/artifacts/
RUN rm -rf /etc/bahmni_config
RUN unzip -u -d /etc/bahmni_config /tmp/artifacts/clinic_config.zip

COPY bahmni-emr/resources/*.omod /usr/local/tomcat/.OpenMRS/modules/

RUN rm -rf /tmp/artifacts

