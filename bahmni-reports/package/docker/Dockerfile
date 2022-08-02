FROM bahmni/reports:latest

RUN rm -rf /etc/bahmni_config
RUN mkdir -p /etc/bahmni_config/reports/

ADD bahmni-reports/resources/clinic_config.zip /tmp/artifacts/
RUN unzip -d /tmp/artifacts/clinic_config/ /tmp/artifacts/clinic_config.zip
RUN cp -r /tmp/artifacts/clinic_config/openmrs/apps/reports/. /etc/bahmni_config/reports/

RUN rm -rf /tmp/artifacts

