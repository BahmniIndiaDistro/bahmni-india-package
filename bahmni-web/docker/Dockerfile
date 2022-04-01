FROM bahmni/bahmni-web:latest

EXPOSE 8091

ADD resources/default_config.zip /tmp/artifacts/
ADD resources/ndhm-react.zip /tmp/artifacts/

RUN unzip -d /etc/bahmni_config/ /tmp/artifacts/default_config.zip
RUN unzip -d /tmp/NDHMReact /tmp/artifacts/ndhm-react.zip

RUN cp -a /tmp/NDHMReact/build/. /usr/local/apache2/htdocs/ndhm/
RUN rm -rf /tmp/NDHMReact/build/

RUN rm -rf /tmp/artifacts
