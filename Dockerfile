FROM quay.io/pires/docker-elasticsearch:5.1.2

MAINTAINER pjpires@gmail.com

# Override config, otherwise plug-in install will fail
ADD config /elasticsearch/config

# Install mapper-attachments (https://www.elastic.co/guide/en/elasticsearch/plugins/5.x/mapper-attachments.html)
RUN ./elasticsearch/bin/elasticsearch-plugin install mapper-attachments

# Install search-guard-ssl
RUN ./elasticsearch/bin/elasticsearch-plugin install -b com.floragunn:search-guard-ssl:5.1.1-19

# Install s3 repository plugin
RUN ./elasticsearch/bin/elasticsearch-plugin install repository-s3

# Set environment
ENV NAMESPACE default 
ENV DISCOVERY_SERVICE elasticsearch-discovery
