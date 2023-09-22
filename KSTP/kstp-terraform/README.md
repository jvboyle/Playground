# kstp-terraform

<!-- TOC -->

- [kstp-terraform](#kstp-terraform)
- [](#)
  - [Description](#description)
  - [Required Packages](#required-packages)
  - [Instructions](#instructions)
  - [Directories](#directories)
  - [Terraform States](#terraform-states)
    - [AWS Local State](#aws-local-state)
    - [AWS Remote State](#aws-remote-state)
  - [Directory Structure](#directory-structure)
  - [Authentication](#authentication)
  - [Troubleshooting](#troubleshooting)
  - [Azure Pipelines](#azure-pipelines)
    - [Adding YML files](#adding-yml-files)
    - [Updating YML files](#updating-yml-files)

<!-- /TOC -->
#
## Description

Manages infrastructure as code across multiple projects

## Required Packages 

| name | version |discription |
| --- | --- | --- |
|terraform | runs the code on NSX-T 
|tflint | syntax validation for terraform
|tfsec | best practive security audit tool 
|python3 | Python programming language 

## Instructions

Before creating/running any terraform configuration in the `projects` folder, make sure the remote state exists for the project by looking at the `_init/{cloud-provider}/000-remote-state/terraform.tfstate.d` folder.

## Directories

Review the following directories to get a better understanding how they are used:

- [_init](_init/README.md)

- [modules](modules/README.md)

- [projects](projects/README.md)

## Terraform States

### AWS Local State

See how to leverage local workspace [here](_init/README.md)

### AWS Remote State

Leverages Azure Blob with locking. 

## Directory Structure

Terraform configuration prefixed with `0xx` requires to be run manually.

## Authentication

Create a Shell script to export you Active Directory Credenitals for NSX-T login, THis file should not be part of the GIT repo so as not to be commited 
 
```
export NSXT_MANAGER_HOST="10.63.70.200"
export NSXT_USERNAME="JBoyle@ap1.sp.ibm.local"
export NSXT_PASSWORD="PASSWORD"
```

## Troubleshooting

If the following error appears, you must **delete** the `.terraform` directory from the affected terraform configuration (i.e. 000-remote-state/.terraform). This error usually occurs when a new terraform executable has been installed:

![terraform init error](./_assets/init-error.png)

## Azure Pipelines

Azure Pipelines is used for CI/CD.

### Adding YML files

Creating a new terraform configuration will **require** Azure Pipeline YML files to allow CI/CD to be put in place. To make it easier, there is an `azure-pipelines` folder in [_examples](./_examples) to copy/paste into the location of the new terraform configuration.

Here's an example of the expected output once CI/CD is added to a terraform configuration:

![azure pipelines example](./_assets/example-output.png)

### Updating YML files

Once `azure-pipelines` folder is added to the terraform configuration, the parameters in each YML file will need to be modified. Replace all text wrapped in `{}` including the brackets. For more information on how to replace text with the correct values, see here:


  - Please replace with the same values used inside brackets that is used for parameters
    ```
    paths:
      include:
        - projects/{project}/{tfConfig}/*
      exclude:
        - projects/{project}/{tfConfig}/azure-pipelines/*
    ```

  - Please replace with the same values used inside brackets that is used for parameters
    ```
    pipelines:
      - pipeline: pipelineArtifact # Name of the pipeline resource
        source: "{project}/{tfConfig}_ci" # Name of the triggering pipeline
        trigger:
          branches:
            - main
    ```
