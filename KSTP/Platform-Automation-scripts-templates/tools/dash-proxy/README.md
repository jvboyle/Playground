coming soon....


### Installation:

`helm install dash-proxy-chart -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="<unique ID from uuidgen command" --set dash_proxy.clusterName="<Name of Cluster>" --set dash_proxy.clusterLocation="<region ID>" --tls`

`helm install dash-proxy-chart -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="" --set dash_proxy.clusterName="ICP3 Non-Prod" --set dash_proxy.clusterLocation="WDC" --tls`


### ClusterIDs:

These values are created using the `uuidgen` command. They are the unique identifier to the IBM DevOps Portal ( i.e. Dash )

*Non-prod*

ICP1:  7614a63a-4a39-4395-bbc7-07241c19c7e8

ICP2:  79f7e379-76f5-4e24-96f3-ad64fba4cb63

ICP3:  be1df165-270c-4b9c-9ddd-845e991bb46e

PDR :  b0bee3d9-38d5-4733-865d-17f50c246468

*NEW Non-Prod*
SRES Non-Prod: 7a93bc03-914f-4ed7-98ac-13b55d73e921

PDR Non-Prod: 63e5f193-f5c8-461f-ac0c-9fb426afde13

*Prod AG:*
GRES1: 3e39c3ca-9233-439d-b079-902d20821b19

GRES2: c323f62b-1e67-4ac0-aed3-57b67edbb8e3

SRES2: f86c22a4-3fba-4c7d-acdc-001b734624a1

PDR: 15b26a58-283f-4b46-960d-950282b2b481

DRES16 (MCMP-Learn) : c34b7188-d263-4e00-b0c4-c80258d7b2a8

DRES47 (IAP): cd97bbf9-2b26-4ffb-b1fe-28f0f793c422

Talos-OCP: 02386636-6f04-49c3-bb95-601b87aff914

*Prod EU:*

SRES2: 0df340b7-1ce9-403e-9b41-ac0716b67ed7
