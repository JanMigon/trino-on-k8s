#!/bin/bash

set -e

REPONAME=janiomanio/hivemetastore
TAG=0.1

docker build -t $REPONAME .

# Tag and push to the public docker repository.
docker tag $REPONAME $REPONAME:$TAG
#docker push $REPONAME:$TAG


# Update configmaps
kubectl create configmap metastore-cfg --dry-run --from-file=metastore-site.xml --from-file=core-site.xml -o yaml | kubectl apply -f -
