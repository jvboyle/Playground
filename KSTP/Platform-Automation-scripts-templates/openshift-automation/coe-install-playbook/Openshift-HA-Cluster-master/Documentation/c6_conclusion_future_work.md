##### CHAPTER 6
# Conclusion and Future Work


### 4.1 Conclusion and value points
The automation of deployment of OpenShift cluster brings a lot of value points.
 1. __Improve time to market__ – This solution will immensely improve time to market of the cluster. Where it took around 2 weeks for the deployment, it will now consume only around 4-5 hours. There is a massive 95% improvement in time to market. 
 2. __Abstraction of deployment complexity__ – As the deployment scales, the complexities of the cluster also increase. These complex tasks are now safely executed by the playbooks and don’t require manual configuration. Thus, the operator doesn’t need to worry about minute details and can now focus on areas of higher importance.
 3. __Reduced risk of human errors__ – Since the manual steps have been greatly reduced, there is a minimal chance of human error in the deployment of cluster. Not only it increases our confidence in the cluster, it also improves its stability.
 4. __Reusable for any number of nodes__ – An important feature of this solution is that it can be used for a variety of different configurations. These configurations include different number of nodes, different storage, networking, etc.
 5. __Rip and replace__ – This is a rip-and-replace solution. It means that the cluster can easily be uninstalled and brought up elsewhere with exact same configuration.

With the time factor in mind, the delivery teams can quickly run a single playbook through Ansible Tower to deploy the cluster in a matter of few hours. This automated solution is quite crucial for IBM Cloud in this fast-paced business world and can play a key role in IBM’s journey towards cloud COE.

### 4.2 Future Work
 - Integration with tools like ICDS (for Automated Provisioning of the VMs, Storage, network, etc.)
 - Automation to include deployment of service mesh into OCP cluster (e.g. ISTIO)
 - Integration with private cloud-as-a-service
