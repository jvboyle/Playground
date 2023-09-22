#!/bin/bash

kubectl apply -f ../../monitoring-config/Platform_Hosting_Service/cm-monitoring-prometheus-alertmanager.yaml

# This command NEEDs to take in a variable that is the IP address of the NetCool Probe
kubectl apply -f ../../monitoring-config/Platform_Hosting_Service/cm-monitoring-prometheus-alertmanager.yaml

kubectl apply -f ../../monitoring-config/Platform_Hosting_Service/cm-alert-rules.yaml
