#!/bin/bash
display_usage() { 
	echo "This script reqires a namespace name to be provided." 
	echo -e "\nUsage:\current-size.sh [namespace name] \n" 
	} 
# if less than two arguments supplied, display usage 
	if [  $# -lt 1 ] 
	then 
		display_usage
		exit 1
	fi 

echo `date`
#kubectl top nodes
#for z in "${arr[@]}"
for z in "$@"
do
    echo ""
    echo ""
    echo "++++++++++++++++++++++++++++++++++++++"
    echo  $z

    echo $z "Top Pods "
    kubectl top pod -n $z
    kubectl get pods -n $z -o wide
    echo "====================================="
    echo "namespace     :     pod name    :    pod short name    :     memory requested    :     memory limit set"
    kubectl get po -n $z -o=jsonpath="{range .items[*]}{.metadata.namespace}   :   {.metadata.name}{range .spec.containers[*]}  {.name}   :   {.resources.requests.memory}   :   {.resources.limits.memory}{'\n'}{end}{'\n'}{end}"
    echo "====================================="

    set -euo pipefail

    # This statement is unique to the cluster and changes for version
    nodes=$(kubectl get node --no-headers -o custom-columns=NAME:.metadata.name |grep icp[123]n)
	#when movement to ICP 3.1 is complete this will need to change to this:
	#nodes=$(kubectl get node |grep worker  | awk '{print $1}')
	echo "" >/tmp/current-size.txt

    for node in $nodes; do
      #echo "Node: $node"
      kubectl describe node "$node" | sed '1,/Non-terminated Pods/d' >>/tmp/current-size.txt
      #echo
    done
    grep $z /tmp/current-size.txt
    echo "==Storage==================================="
    echo "PVs"
    kubectl get pv | grep $z
    echo "PVCs"
    kubectl get pvc -n $z
done
