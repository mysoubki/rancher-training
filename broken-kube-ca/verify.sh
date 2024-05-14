#!/bin/bash

export KUBECONFIG=kube_config_cluster.yml
kubectl -n swiss-army-knife get pod -l app=swiss-army-knife

echo "Testing kubectl from swiss-army-knife to test the SA tokens..."
PodName=`kubectl -n swiss-army-knife get pod -l app=swiss-army-knife -o NAME | awk -F '/' '{print $2}'`
echo "TLS verify enabled"
kubectl -n swiss-army-knife exec -it ${PodName} -- kubectl version
echo "TLS verify disabled"
kubectl -n swiss-army-knife exec -it ${PodName} -- kubectl version --insecure-skip-tls-verify
