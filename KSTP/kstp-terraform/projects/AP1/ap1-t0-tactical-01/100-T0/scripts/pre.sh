echo "run : curl -X POST -H "Content-Type: application/json" -d @../Etn_json/ap1-etn-011.json -u $NSXT_USERNAME https://10.63.70.200/api/v1/transport-nodes --insecure"
echo "run : curl -X POST -H "Content-Type: application/json" -d @../Etn_json/ap1-etn-012.jsonn -u $NSXT_USERNAME https://10.63.70.200/api/v1/transport-nodes --insecure"

## Have to sleep for 10 min then 
#Manual
#Cluster  = agg-dr002-etn-cluster
#Profile = dt1-nsxt-fra04-dt1-m1-edge-cluster-profile
#type = Edge Node
# Nodes 
# dt1-etn-012
# dt1-etn-013