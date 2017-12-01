FROM quay.io/pires/docker-elasticsearch:6.0.0

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV REPO_LOCATIONS []

# Kubernetes requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false

RUN mv /run.sh /run1.sh
COPY run.sh /
