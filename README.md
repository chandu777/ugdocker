# docker-usergrid

docker run -e CLUSTER_NAME="usergrid_cluster" -e SEEDS="default" -e Endpoint_Snitch="GossipingPropertyFileSnitch" -e DC_NAME="pune_dc" -e RACK_NAME="rack_p1" gitcass

docker run -e ES_CLUSTER_NAME="usergridcluster" gites

docker run -e CASSANDRA_URL="172.17.0.2" -e ELASTICSEARCH_HOST="172.17.0.3" ugtomcat
