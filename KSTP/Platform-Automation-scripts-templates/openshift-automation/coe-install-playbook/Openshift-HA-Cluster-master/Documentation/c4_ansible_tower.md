##### CHAPTER 4

# Ansible Tower

### 4.1 Introduction

Before proceeding with the usage manual, the components are briefly described.

 1. __Hosts__: These are the target machines on which the job templates are launched.
 2. __Inventory__: An Inventory is a collection of hosts against which jobs may be launched. Inventory is sub divided into various groups which enables applying common properties to similar hosts.
 3. __Project__: A Project is a logical collection of Ansible playbooks, represented in Ansible Tower. Playbooks can be added directly from github repository as well.
 4. __Credentials__: Credentials are utilized by Tower for authentication when launching Jobs against machines, synchronizing with inventory sources, and importing project content from a version control system.
 5. __Templates__: A job template is a definition and set of parameters for running an Ansible job. Job templates are useful to execute the same job many times. To run a playbook from a project, a job template must be created.
 6. __Workflow__: Job or workflow templates are linked together using a graph-like structure called nodes. These nodes can be jobs, project syncs, or inventory syncs.
 
### 4.2 Creating a New project
 
To Start with a project, the user must create a Project in the ansible tower through the "Projects" tab.
 
 ======photo=========
 
The source code can be added from the Git repository. This is done by selecting "Git" in _SCM type_. Specify the URL of Git repository in the SCM URL and the branch to be used in SCM BRANCH. This creates a project.
 
### 4.3 Create credentials
 
To provide Ansible tower with the access of the VMs, credentials need to be created.
 
 ========== photot===========
 
To use the host username and password as the credential, select Machine in _CREDENTIAL TYPE_. If you want to use this credential for an Inventory that has multiple hosts, ensure that all the hosts have the same password.
 
### 4.4 Create Inventory
 
To create an Inventory, specify the name and any variable you want for the inventory. 
 
 ======photo==========
 
To create groups in the inventory, click on HOSTS tab and add create the group. The variable specified here will be common to all the hosts belonging to the same group.


=======photo-=========


Add Hosts in the group, specify variables if needed. 


======photo========

### 4.5 Creating Job Template

To execute a playbook, a job template must be created.

=======photo==========

Select the following:
 -	Inventory
 -	Project
 -	Playbook
 -	Credentials
 -	Forks
 -	Verbosity
 
Any extra variable needed to be specified can be specified here. Similarly, create separate  template for Master playbook and Deploy Cluster. While creating the template for Master Playbook copy the variables present in the vars file into the extra variable section and edit them as per need.


=====photo=========

### 4.6 Create Workflow

Workflow will enable to define a sequence in which the templates (playbooks) will get executed. 


=======phjoto======

Click on the WORKFLOW VISUALISER tab to define the workflow



=========photo=========

The user can also specify when the next template will start i.e., whether to run the template on successful execution of the pervious template or to always run it. The final Workflow would look like this.

======photo======



