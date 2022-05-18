FROM bahmni/bahmni-web:latest

EXPOSE 8091

ADD bahmni-web/resources/clinic_config.zip /tmp/artifacts/
ADD bahmni-web/resources/ndhm-react.zip /tmp/artifacts/

RUN unzip -o -d /usr/local/apache2/htdocs/bahmni_config /tmp/artifacts/default_config.zip

RUN unzip -d /tmp/NDHMReact /tmp/artifacts/ndhm-react.zip

RUN cp -a /tmp/NDHMReact/build/. /usr/local/apache2/htdocs/ndhm/
RUN rm -rf /tmp/NDHMReact/build/

RUN rm -rf /tmp/artifacts
