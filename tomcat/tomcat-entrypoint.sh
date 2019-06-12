#!/bin/bash
USERGRID_PROPERTIES_FILE=$TOMCAT_HOME/lib/usergrid-deployment.properties

env | grep ug_* > data.dat
sed 's/ug_//g' data.dat > data_ug.dat
while IFS='=' read -r key value; do
sed -i 's/'"$key"'=.*/'"$key"'='"$value"'/g' ${USERGRID_PROPERTIES_FILE}
done < data_ug.dat

exec "$@"
