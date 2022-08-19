FROM bahmni/openmrs:latest

ADD bahmni-emr/resources/clinic_config.zip /tmp/artifacts/
RUN rm -rf /etc/bahmni_config
RUN unzip -u -d /etc/bahmni_config /tmp/artifacts/clinic_config.zip
RUN cp -r /etc/bahmni_config/masterdata/configuration/ /usr/local/tomcat/.OpenMRS/configuration/
RUN rm -rf /usr/local/tomcat/.OpenMRS/modules/emrapi-1.32.0.omod
COPY bahmni-emr/resources/*.omod /usr/local/tomcat/.OpenMRS/modules/

RUN rm -rf /tmp/artifacts

