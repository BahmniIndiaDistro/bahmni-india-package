FROM bahmniindiadistro/openmrs:latest

RUN mkdir -p /etc/profiling/

# YourKit installation for Java profiling
RUN wget https://www.yourkit.com/download/docker/YourKit-JavaProfiler-2022.9-docker.zip -P /tmp/ && \
  unzip /tmp/YourKit-JavaProfiler-2022.9-docker.zip -d /etc/profiling && \
  rm /tmp/YourKit-JavaProfiler-2022.9-docker.zip