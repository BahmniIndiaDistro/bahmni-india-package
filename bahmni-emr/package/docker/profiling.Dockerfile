FROM bahmniindiadistro/openmrs:perf-test

# COPY bahmni-emr/package/docker/resources/modify-server-properties.sh modify-server-properties.sh
# RUN chmod +x modify-server-properties.sh 
# RUN ./modify-server-properties.sh
# RUN rm -rf modify-server-properties.sh

RUN mkdir -p /etc/profiling/
RUN yum install -y \
    wget \
    unzip

# YourKit installation for Java profiling
RUN wget https://www.yourkit.com/download/docker/YourKit-JavaProfiler-2022.9-docker.zip -P /tmp/ && \
  unzip /tmp/YourKit-JavaProfiler-2022.9-docker.zip -d /etc/profiling && \
  rm /tmp/YourKit-JavaProfiler-2022.9-docker.zip
  