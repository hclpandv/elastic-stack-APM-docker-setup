#!/usr/bin/env bash

# Download this example configuration file as a starting point
curl -L -O https://raw.githubusercontent.com/elastic/apm-server/7.5/apm-server.docker.yml

# setup apm-server docker container with volumes

# Substitute your Elasticsearch hosts and ports.
# If you are using the hosted Elasticsearch Service in Elastic Cloud, replace the -E output.elasticsearch.hosts 
# line with the Cloud ID and elastic password using the syntax shown earlier

docker run -d \
  --name=apm-server \
  --user=apm-server \
  --volume="$(pwd)/apm-server.docker.yml:/usr/share/apm-server/apm-server.yml:ro" \
  docker.elastic.co/apm/apm-server:7.5.2 \
  --strict.perms=false -e \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]
