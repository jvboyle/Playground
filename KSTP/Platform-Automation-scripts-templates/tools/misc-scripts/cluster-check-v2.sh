#/bin/bash

declare -a arr=("blueintegrate-dev" )

echo `date` > /tmp/cluster-check.txt
kubectl top nodes  >>/tmp/cluster-check.txt 
for z in "${arr[@]}"
do
    echo $z "Top Pods ">> /tmp/cluster-check.txt 
    kubectl top pod -n $z >>/tmp/cluster-check.txt
    kubectl get pods -n $z -o wide >>/tmp/cluster-check.txt
    echo "=====================================" >> /tmp/cluster-check.txt
    echo "namespace : pod name : pod short name : memory requested:  memory limit set" >> /tmp/cluster-check.txt
    kubectl get po -n $z -o=jsonpath="{range .items[*]}{.metadata.namespace}:{.metadata.name}{range .spec.containers[*]}  {.name}:{.resources.requests.memory}:{.resources.limits.memory}{'\n'}{end}{'\n'}{end}" >>/tmp/cluster-check.txt
    echo "=====================================" >> /tmp/cluster-check.txt
    
done

for x in "${arr[@]}"
do
    echo "Details ===============================================================" >> /tmp/cluster-check.txt
      echo "———————————"$x"———————————" >> /tmp/cluster-check.txt
      kubectl get pod -n $x  | for i in `awk {'print $1'}`; do kubectl describe pod $i -n $x ; done >> /tmp/cluster-check.txt
    echo "NEXT ===============================================================" >> /tmp/cluster-check.txt
done

echo "END ===============================================================" >> /tmp/cluster-check.txt