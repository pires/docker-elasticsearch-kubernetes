FROM quay.io/pires/docker-elasticsearch:5.6.4

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Set environment
ENV DISCOVERY_SERVICE elasticsearch-discovery
ENV STATSD_HOST=statsd.statsd.svc.cluster.local
ENV SEARCHGUARD_SSL_TRANSPORT_ENABLED=true
ENV SEARCHGUARD_SSL_HTTP_ENABLED=true

# Fix bug installing plugins
ENV NODE_NAME=""

# Install mapper-attachments (https://www.elastic.co/guide/en/elasticsearch/plugins/5.x/mapper-attachments.html)
RUN ./elasticsearch/bin/elasticsearch-plugin install mapper-attachments

# Install search-guard-ssl
RUN ./elasticsearch/bin/elasticsearch-plugin install -b com.floragunn:search-guard-ssl:5.6.4-23

# Install s3 repository plugin
RUN ./elasticsearch/bin/elasticsearch-plugin install repository-s3

# Install statsd plugin
RUN ./elasticsearch/bin/elasticsearch-plugin install https://github.com/Automattic/elasticsearch-statsd-plugin/releases/download/5.6.4.0/elasticsearch-statsd-5.6.4.0.zip
