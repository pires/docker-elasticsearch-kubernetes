FROM quay.io/pires/docker-elasticsearch:5.5.1

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery

# kubernetes runtime requires swap is turned off, so memory lock is redundant
ENV MEMORY_LOCK false
