# Platform Hosting Service Monitoring Configuration Scripts and Processes

## Purpose

The information described on this page are using as base the definitions from the [IBM Monitoring Service Helm Chart](https://github.com/IBM/charts/tree/master/stable/ibm-icpmonitoring), which is used to deploy [Prometheus](https://prometheus.io), [Grafana](https://grafana.com/) and related exporters to gather metrics from configured targets, evaluate alert rules, visuliaze the metrics in preinstalled dashboards.

The main purpose of this document is: 

- Describe how the monitoring services are deployed at the ISPwW Platform.
- Describe how to customize the existing settings.
- Describe how to setup the monitoring on new ICP instances as required.
- Describe how to send the events from Prometheus to IBM Tivoli Netcool/OMNibus Probe for Message Bus.


## Tools & Components

- [Prometheus](https://github.com/prometheus) : Prometheus, a Cloud Native Computing Foundation project, is a systems and service monitoring system. It collects metrics from configured targets at given intervals, evaluates rule expressions, displays the results, and can trigger alerts if some condition is observed to be true.
- [AlertManager](https://github.com/prometheus/alertmanager) : Alertmanager handles alerts sent by client applications such as the Prometheus server. It takes care of deduplicating, grouping, and routing them to the correct receiver integration such as email, PagerDuty, or OpsGenie. It also takes care of silencing and inhibition of alerts.
- [Node_Exporter](https://github.com/prometheus/node_exporter) : Prometheus exporter for hardware and OS metrics exposed by \*NIX kernels, written in Go with pluggable metric collectors.
- [CAdvisor](https://github.com/google/cadvisor) (Container Advisor) is an open source container resource usage collector. It is purpose built for containers and supports Docker containers natively. Unlike most elements within Kubernetes that operate at the Pod level, cAdvisor operates per node.
- [Grafana](https://github.com/grafana/grafana) is an open source metric analytics & visualization suite. It is most commonly used for visualizing time series data for infrastructure and application analytics but many use it in other domains including industrial sensors, home automation, weather, and process control.
- [IBM Tivoli Netcool/OMNIbus Probe for Message Bus](https://www.ibm.com/support/knowledgecenter/en/SSSHTQ/omnibus/probes/message_bus/wip/concept/messbuspr_intro.html) : The IBM Tivoli Netcool/OMNIbus Probe for Message Bus can acquire XML and JSON events from various sources using Java™ Message Service (JMS), HTTP/HTTPS, Message Queue Telemetry Transport (MQTT), Web Socket or data files. It then converts these events into Netcool/OMNIbus events and sends them to the ObjectServer.

## Requirements

- IBM Cloud Private 2.1.0.3 or higher for deployment mode "managed"
- PV provisioner support in the underlying infrastructure
- [IBM Monitoring Service Helm Chart](https://github.com/IBM/charts/tree/master/stable/ibm-icpmonitoring) must be successfully deployed to ICP.


## Required Files

If the default monitoring chart is successfully deployed, the only required changes to configure Prometheus will be done at the following ConfigMaps:

Configmap                                   | Description
------------------------------------------- | ------------
monitoring-prometheus.yaml                  | Contains the `prometheus.yml` file, which is where all basic definitions for Prometheus server are located, such as default ports, address for the service endpoints to be scraped, and path for rule files. **It's important to notice that on this implementation Prometheus is configured with any rule files on `/etc/alert-rules/*.rules` and `/etc/alert-rules/*.yaml`**. 
monitoring-prometheus-alertmanager.yaml     | Contains the `alertmanager.yml` file, which is where all definitions for the Alertmanager server are located, such as the **Webhook receiver** which is required to send notifications to Slack or to the Netcool Message Bus Probe. **This file is where the IP / URL is defined for the event destination.**
alert-rules.yaml                            | Contains the `icp_base_rules.yml` file, which contains all required rule files with the current Alert definitions. **On this implementation the following rule files are created: `node.rules`, `prometheus.rules`, `kubelet.rules`, `general.rules`.**


### Modifying the "target", or receiver of Events/Alerts


1 - In order to customize Alertmanager to send events to Slack (channel #sp-monitoring), download [cm-monitoring-prometheus-alertmanager.yaml](./Platform_Hosting_Service/cm-monitoring-prometheus-alertmanager.yaml) and apply the configuration with `kubectl apply -f cm-monitoring-prometheus-alertmanager.yaml`.

```yaml
apiVersion: v1
data:
  alertmanager.yml: |-
    global:
    receivers:
      - name: default-receiver
        slack_configs:
        - api_url: 'https://hooks.slack.com/services/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'
          channel: '#sp-monitoring'
          text: "<!channel> \nsource: eu1sr1icp1\ndescription: {{ .CommonAnnotations.description }}\nsummary: {{ .CommonAnnotations.summary }}"
          send_resolved: true
    route:
      group_by: ['alertname','instance','kubernetes_namespace','pod','container','node']
      group_wait: 10s
      group_interval: 5m
      receiver: default-receiver
      repeat_interval: 3h
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"alertmanager.yml":"global:\nreceivers:\n  - name: default-receiver\n    slack_configs:\n    - api_url: 'https://hooks.slack.com/services/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'\n      channel: '#sp-monitoring'\n      send_resolved: true\nroute:\n  group_by: ['alertname','instance','kubernetes_namespace','pod','container','node']\n  group_wait: 10s\n  group_interval: 5m\n  receiver: default-receiver\n  repeat_interval: 3h"},"kind":"ConfigMap","metadata":{"annotations":{},"labels":{"app":"monitoring-prometheus","component":"alertmanager"},"name":"monitoring-prometheus-alertmanager","namespace":"kube-system","selfLink":"/api/v1/namespaces/kube-system/configmaps/monitoring-prometheus-alertmanager"}}
  labels:
    app: monitoring-prometheus
    component: alertmanager
  name: monitoring-prometheus-alertmanager
  namespace: kube-system

```

2 - In order to customize Alertmanager to send events to Netcool Message Bus Probe (100.72.68.142), download the template file below and apply the configuration with `kubectl apply -f cm-monitoring-prometheus-alertmanager.yaml`.


```yaml
apiVersion: v1
data:
  alertmanager.yml: |-
    global:
    receivers:
      - name: 'netcool_probe'
        webhook_configs:
        - url: 'http://100.72.68.142:8443'
          send_resolved: true
    route:
      group_wait: 10s
      group_interval: 5m
      receiver: 'netcool_probe'
      repeat_interval: 3h
kind: ConfigMap
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"v1","data":{"alertmanager.yml":"global:\nreceivers:\n  - name: default-receiver\nroute:\n  group_wait: 10s\n  group_interval: 5m\n  receiver: default-receiver\n  repeat_interval: 3h"},"kind":"ConfigMap","metadata":{"annotations":{},"labels":{"app":"monitoring-prometheus","component":"alertmanager"},"name":"monitoring-prometheus-alertmanager","namespace":"kube-system"}}
  labels:
    app: monitoring-prometheus
    component: alertmanager
  name: monitoring-prometheus-alertmanager
  namespace: kube-system
```



### Adding new events/alerts to monitor

In order to customize the existing Alert Rules, one should download [cm-alert-rules.yaml](./Platform_Hosting_Service/cm-alert-rules.yaml) and apply the configuration with `kubectl apply -f cm-alert-rules.yaml`, the following alerts are currently implemented:

Alert         | Description
--------------------- | ---------------------------
ICPHostCPUUtilisation | High CPU utilisation detected for instance
ICPMonitoringHeartbeat  | This is a Hearbeat event meant to ensure that the entire Alerting pipeline
ICPApiServerLatency  | Kubernetes apiserver latency is high
ICPApiserverDown  | API server unreachable
ICPFdExhaustionClose  | File descriptors soon exhausted for the monitoring target
ICPHostHighMemeoryLoad  | Memory utilization Alert
ICPKubeletDown  |Many Kubelets cannot be scraped
ICPKubeletTooManyPods  | Kubelet is close to pod limit
ICPManyNodesNotReady  | Many Kubernetes nodes are Not Ready
ICPMonitoringTargetDown  | Targets are down
ICPNodeDiskPressure  | Node is under disk pressure.
ICPNodeExporterDown  | node-exporter cannot be scraped
ICPNodeMemoryPressure  | Node is under memory pressure.
ICPNodeNotReady  | Node status is NotReady
ICPNodeOutOfDisk  | Node ran out of disk space.
ICPNodeSwapUsage  | Node Swap usage usage is above 75% 
ICPPodFrequentlyRestarting  |  Pod is restarting frequently
ICPPreditciveHostDiskSpace  | Predictive Disk Space Utilisation Alert
ICPTooManyOpenFileDescriptors  | Too many open file descriptors for the monitoring target
PrometheusConfigReloadFailed  | Prometheus configuration reload has failed
PrometheusErrorSendingAlerts  | Errors while sending alert from Prometheus
PrometheusErrorSendingAlerts  | Errors while sending alert from Prometheus
PrometheusIngestionThrottling  | Prometheus is (or borderline) throttling ingestion of metrics
PrometheusNotConnectedToAlertmanagers  | Prometheus is not connected to any Alertmanagers
PrometheusNotificationQueueRunningFull  | Prometheus alert notification queue is running full


