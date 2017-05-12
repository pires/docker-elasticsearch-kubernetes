FROM quay.io/pires/docker-elasticsearch:5.4.0

MAINTAINER pjpires@gmail.com

# Install Elasticsearch plug-ins
RUN NODE_NAME=${NODE_NAME:-$(uuidgen)} /elasticsearch/bin/elasticsearch-plugin install -b https://github.com/vvanholl/elasticsearch-prometheus-exporter/releases/download/5.2.2.0/elasticsearch-prometheus-exporter-5.2.2.0.zip

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery
