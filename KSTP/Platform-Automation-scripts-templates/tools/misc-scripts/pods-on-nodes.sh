#!/bin/bash
set -euo pipefail

echo -e "Iterating...\n"
echo `date`

nodes=$(kubectl get node --no-headers -o custom-columns=NAME:.metadata.name |grep icp[123]n)
#when movement to ICP 3.1 is complete this will need to change to this:
#nodes=$(kubectl get node |grep worker  | awk '{print $1}')


for node in $nodes; do
  echo "Node: $node"
  kubectl describe node "$node" | sed '1,/Non-terminated Pods/d'
  echo
done