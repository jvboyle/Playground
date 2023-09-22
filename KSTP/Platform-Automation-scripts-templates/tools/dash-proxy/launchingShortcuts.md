#

# prod

helm291 install dash-proxy-chart -f ../../region-configs/prod/ag1/prodag-gres-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="3e39c3ca-9233-439d-b079-902d20821b19" --set dash_proxy.clusterName="Prod AG GRES" --set dash_proxy.clusterLocation="WDC" --tls

helm291 install dash-proxy-chart  -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="3e39c3ca-9233-439d-b079-902d20821b19" --set dash_proxy.clusterName="Prod AG GRES" --set dash_proxy.clusterLocation="WDC"



helm install dash-proxy-chart -f ../../region-configs/prod/ag1/prodag-sres-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="f86c22a4-3fba-4c7d-acdc-001b734624a1" --set dash_proxy.clusterName="Prod AG SRES2" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart -f ../../region-configs/prod/ag1/prodag-dr47-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="cd97bbf9-2b26-4ffb-b1fe-28f0f793c422" --set dash_proxy.clusterName="Prod AG DR47" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart -f ../../region-configs/prod/eu1/prodeu-sres-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="0df340b7-1ce9-403e-9b41-ac0716b67ed7" --set dash_proxy.clusterName="Prod EU SRES2" --set dash_proxy.clusterLocation="AMS" --tls

helm3 install dash-proxy-march dash-proxy-chart -f ../../region-configs/prod/eu1/prodeu-sres-proxy-config.yaml  --namespace dash-proxy --set dash_proxy.clusterID="0df340b7-1ce9-403e-9b41-ac0716b67ed7" --set dash_proxy.clusterName="Prod EU SRES2" --set dash_proxy.clusterLocation="AMS"

# -------------------------------------------
# new non-prod

helm install dash-proxy-chart -f ../../region-configs/new-non-prod/nonprodag-sres-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="7a93bc03-914f-4ed7-98ac-13b55d73e921" --set dash_proxy.clusterName="Non-Prod SRES" --set dash_proxy.clusterLocation="WDC" --tls

NO PROXY
helm install dash-proxy-chart -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="7a93bc03-914f-4ed7-98ac-13b55d73e921" --set dash_proxy.clusterName="Non-Prod SRES" --set dash_proxy.clusterLocation="WDC" --tls


# -------------------------------------------
# OLD
helm install dash-proxy-chart  -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="b0bee3d9-38d5-4733-865d-17f50c246468" --set dash_proxy.clusterName="PDR Non-Prod" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart  -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="7614a63a-4a39-4395-bbc7-07241c19c7e8" --set dash_proxy.clusterName="ICP1 Non-Prod" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart  -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="79f7e379-76f5-4e24-96f3-ad64fba4cb63" --set dash_proxy.clusterName="ICP2 Non-Prod" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart  -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="be1df165-270c-4b9c-9ddd-845e991bb46e" --set dash_proxy.clusterName="ICP3 Non-Prod" --set dash_proxy.clusterLocation="WDC" --tls

<!--
helm install dash-proxy-chart -f ../../region-configs/new-non-prod/nonprodag-pdr-proxy-config.yaml -n dash-proxy --namespace dash-proxy --set dash_proxy.clusterID="63e5f193-f5c8-461f-ac0c-9fb426afde13" --set dash_proxy.clusterName="Non-Prod PDR" --set dash_proxy.clusterLocation="WDC" --tls
-->
<!--
helm install dash-proxy-chart -f ../../region-configs/prod/ag1/prodag-pdr-proxy-config.yaml -n dash-proxy-platform --namespace dash-proxy-platform --set dash_proxy.clusterID="15b26a58-283f-4b46-960d-950282b2b481" --set dash_proxy.clusterName="Prod AG PDR" --set dash_proxy.clusterLocation="WDC" --tls

helm install dash-proxy-chart -f ../../region-configs/prod/ag1/prodag-dr16-proxy-config.yaml -n dash-proxy-platform --namespace dash-proxy-platform --set dash_proxy.clusterID="c34b7188-d263-4e00-b0c4-c80258d7b2a8" --set dash_proxy.clusterName="Prod AG DR16" --set dash_proxy.clusterLocation="WDC" --tls

-->
