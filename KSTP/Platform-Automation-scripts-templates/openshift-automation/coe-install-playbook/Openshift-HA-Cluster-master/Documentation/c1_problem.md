#### CHAPTER 1
# Introduction


Red Hat OpenShift is a family of containerization software. Its flagship product is the OpenShift Container Platform which is an on-premises private PaaS (Platform as a Service) product, built around containerization software called Docker and orchestration suite called Kubernetes. OpenShift Origin is a community distribution of OCP. 

OpenShift container platform provides a PaaS that enables the developer to choose from a variety of environments depending on their application. The developer need not worry about installing dependencies, configuring monitoring software, etc and instead focus more on coding their application.

The deployment of this cluster over a set of nodes – virtual machines, requires specific configuration of the machines. This process involves many manual steps – taking about 2 weeks to complete. The steps include:
- Network Configuration
-	Installation of required packages
-	Containerization software setup
-	Orchestration suite configuration
-	Storage setup
-	Installation of GUI web interface

### 1.1	Problem statement
As briefly described, the deployment method of the cluster used earlier consisted largely of manual steps. This takes an FTE about 2 weeks’ time to manually configure the requirements of the cluster. The task is to develop an automated workflow to deploy the OpenShift cluster. This workflow must tackle the different requirements of the cluster, like number of nodes, storage size to name a few. 
