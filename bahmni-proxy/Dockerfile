FROM bahmni/proxy:latest

COPY bahmni-proxy/resources/bahmni-abdm-proxy.conf /usr/local/apache2/conf/
COPY bahmni-proxy/resources/abdm-service-rewrite.conf /usr/local/apache2/conf/
RUN sed -i "/^<VirtualHost \*:443>/r /usr/local/apache2/conf/abdm-service-rewrite.conf" /usr/local/apache2/conf/bahmni-proxy.conf
RUN echo "Include conf/bahmni-abdm-proxy.conf" >> /usr/local/apache2/conf/httpd.conf

RUN apk add sudo &&\
          sudo apk add python3 &&\
          sudo apk add libffi-dev &&\
          sudo python3 -m venv /opt/certbot/ &&\
          sudo /opt/certbot/bin/pip install certbot &&\
          sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

