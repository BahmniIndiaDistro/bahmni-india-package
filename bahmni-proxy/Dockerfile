FROM bahmni/proxy:latest

COPY bahmni-proxy/resources/bahmni-abdm-proxy.conf /usr/local/apache2/conf/
RUN echo "Include conf/bahmni-abdm-proxy.conf" >> /usr/local/apache2/conf/httpd.conf
