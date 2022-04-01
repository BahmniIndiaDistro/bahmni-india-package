FROM bahmni/proxy:latest

COPY resources/bahmni-abdm-proxy.conf /usr/local/apache2/conf/
RUN echo "Include conf/bahmni-abdm-proxy.conf" >> /usr/local/apache2/conf/httpd.conf
