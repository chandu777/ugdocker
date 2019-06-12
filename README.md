# docker-usergrid
docker run -e CLUSTER_NAME="usergrid_cluster" -e ENDPOINT_SNITCH="GossipingPropertyFileSnitch" -e DC_NAME="pune_dc" -e RACK_NAME="rack_p1" -d usergrid-cassandra

docker run -e ES_CLUSTER_NAME="usergridcluster" -e ES_HEAP_SIZE=2g usergrid-elastic

docker run --env-file env.list usergrid
