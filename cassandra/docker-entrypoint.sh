#!/bin/bash
CASSANDRA_HOME=$CASSANDRA_CONFIG;
CONFIG_FILE=$CASSANDRA_HOME/conf/cassandra.yaml
CASSANDRA_RACKDC_PROP=$CASSANDRA_HOME/conf/cassandra-rackdc.properties
#CASSANDRA_TOPOLOGY_PROP=$CASSANDRA_HOME/conf/cassandra-topology.properties
#CASSANDRA_TOPOLOGY_YAML=$CASSANDRA_HOME/conf/cassandra-topology.yaml

CASSANDRA_BROADCAST_RPC_ADDRESS=$(hostname --ip-address)
CASSANDRA_RPC_ADDRESS=$(hostname --ip-address)
CASSANDRA_SEEDS=$(hostname --ip-address)
CASSANDRA_LISTEN_ADDRESS=$(hostname --ip-address)

set -e

sed -i -e "s/^\(listen_address:\).*/\1 ${CASSANDRA_LISTEN_ADDRESS}/" ${CONFIG_FILE}
sed -i -e "s/^\(rpc_address:\).*/\1 ${CASSANDRA_RPC_ADDRESS}/" ${CONFIG_FILE}
sed -i -e "s/^\(# \)\(broadcast_rpc_address:\).*/\2 ${CASSANDRA_BROADCAST_RPC_ADDRESS}/" ${CONFIG_FILE}

if [ $CLUSTER_NAME ]; then
 echo "cluster name : " $CLUSTER_NAME
 sed -i -e "s/cluster_name: 'Test Cluster'/cluster_name: '${CLUSTER_NAME}'/" ${CONFIG_FILE}
fi

if [ $SEEDS ]; then
 echo "cassandra seeds :" $SEEDS
 sed -i -e "s/^\([ ]*- seeds:\).*/\1 ${SEEDS}/" ${CONFIG_FILE}
else
 echo "cassandra default seeds :" $CASSANDRA_SEEDS
 sed -i -e "s/^\([ ]*- seeds:\).*/\1 ${CASSANDRA_SEEDS}/" ${CONFIG_FILE} 
fi

if [ $ENDPOINT_SNITCH ]; then
 echo "Endpoint Snitch : "$ENDPOINT_SNITCH
 sed -i -e "s/endpoint_snitch: SimpleSnitch/endpoint_snitch: $ENDPOINT_SNITCH/" ${CONFIG_FILE}   
 echo "DC name : " $DC_NAME
 sed -i -e "s/dc=DC1/dc=${DC_NAME}/" ${CASSANDRA_RACKDC_PROP}
 echo "RACK name : " $RACK_NAME
 sed -i -e "s/rack=RAC1/rack=${RACK_NAME}/" ${CASSANDRA_RACKDC_PROP}
 sed -i -e "s/endpoint_snitch: SimpleSnitch/endpoint_snitch: $ENDPOINT_SNITCH/" ${CONFIG_FILE}
fi

exec "$@"

