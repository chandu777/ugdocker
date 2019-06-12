#!/bin/bash

sed -i -e "s/#cluster.name: elasticsearch/cluster.name: ${ES_CLUSTER_NAME}/" ${ES_CONFIG_FILE}
exec "$@"
