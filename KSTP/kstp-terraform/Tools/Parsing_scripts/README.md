# Parsing Process Overview
We are assuming that you are running this process within the container (Docker) that is created to run the migration. 
  
All the commands and paths are related to that container and that you mounted your local branch poiting to "kstp-terraform". In other words, your Docker container **"/SOURCE"** folder is a mount point to your local disk **"kstp-terraform"** folder. 
  
For instance, let's supposse that you cloned the GIT repository in your Windows machine to **"c:/KSTP/GIT/kstp-terraform"**, then your Docker container **"/SOURCE"** would be a mount point to your "c:/KSTP/GIT/kstp-terraform" local folder.


## Python version and scripts' files location
The parsing scripts were written using **Python 3.8** or newer, and that must be your local Python's version to be able to successfully run the parse process.  
  
All scripts are located by default within the following folder:  
*/SOURCE > Tools > Parsing_scripts*  
  
## Overall Parse Process Steps
The parse process have 5 steps
1. Run nsx-export.py
2. Update the JSON files
3. Run parse.py
4. Check the parsed Terraform files
5. Copy the required Terraform files
  
Once all those steps are completed you'll be ready to run the Terraform code.

### 1. Run nsx-export.py
Run: ***python3 nsx-export.py*** 
  
This script will connect to the **NSX-T** (not -V) and it will export all the **services** and **groups** that are created in the NSX-T. Those files are required by the parser scripts.  
  
The NSX export script will ask you few of questions:
1. Which is your geography  
2. What do you need
   1. Export NSX-T Services
   2. Export NSX-T Groups
   3. Export NSX-V Edges
3. It will show your selections, and ask for confirmation.
   
Then the script will ask for your ID to connect to the NSX-T environment, and your password, it will use that info to connect and run the export.  
  
### 2. Update the JSON files
All exported files will be saved within the following folder:  
- **groups**
  /SOURCE > nsx-exports > {geography} > groups > {year} > {month} > {day} > exported
- **services**:
  /SOURCE > nsx-exports > {geography} > services > {year} > {month} > {day} > exported
  
There are 2 JSON files saved within the *'exported'* folder:
- xxxx_exported.json
    - This is the RAW file exported from NSX-T
- xxxx_output.json
    - **This is the file that we'll use** to update the required files for the parse
  
We must update both files 'groups' and 'services', although those files format is different, the update process is exactly the same. 
  
- Open the 'groups' and/or 'services' xxxx_output.json file
- Select all and copy
- Go to *"/SOURCE > mapping_files > {geography}"*
- Open the following file according to what you are updated
  - {geography}_existing_groups.json (for **groups** update)
  - {geography}_existing_services.json (for **services** update)
- Update the following entries with the copied data:
  - "existing_groups" (for **groups** update)
  - "existing_services" (for **services** update)
- Save the existing JSON file
  
**Important:**  
Note that those exiting JSON files have a similar structure, and it is:
```JSON
{
    "Geo": {
        "ID": "",  
        "migration_date": "",  
        "wave": ""
    },
    "existing_services": {},
    "should_migrate": [],
    "not_migrated": [],
}  
```
We are touching (updating) **ONLY** the **"existing_{groups or services}"** entry. And it will always be pre populated and it will be a long list.  
  
Like this example below were we suppressed hundreds of lines:  
```JSON
"existing_services": {
        "AD Server": "/infra/services/AD_Server",
        "AG1_AVI-AG1-NS1": "/infra/services/AG1_AVI-cluster-f4816e05-dbe7-4c82-a127-3bf6114c9378-virtualservice-05f4a3cf-c22d-45c1-b831-3fe42d46f885",
        "AG1_AVI-AG1-SRES-OCP-04-443": "/infra/services/AG1_AVI-cluster-f4816e05-dbe7-4c82-a127-3bf6114c9378-virtualservice-0311561f-04e3-4875-a7f0-410d4705c56f",

        ... there are additional 700 lines here ...

        "vCentre Operations Manager (Standalone) 5.x": "/infra/services/vCentre_Operations_Manager_(Standalone)_5.x",
        "vCentre Operations Manager (vApp) 5.x": "/infra/services/vCentre_Operations_Manager_(vApp)_5.x",
        "vCentre Operations Standard 1.x": "/infra/services/vCentre_Operations_Standard_1.x"
    },
```
  
To update that entry, you just delete everything from { ... }, including both {}, and then paste your exported's file content there. Be sure that you'll keep that final "," (comma).

Now, we are ready to proceed with the parse process.  
  
### 3. Run parse.py
Run: python3 parse.py
  
Follow the instructions displayed in the terminal, and choose your options. At the end the script will display what you selected, and it will ask you to confirm if that is correct or not.  
  
Double check your choices and proceed accordingly.
  
### 4. Check the parsed Terraform files
Once the parse process completed successfully, all the required files to run and inject the Terraform code will be located in:  
/SOURCE > migration_projects > {geography} > {your_project_name} > terraform  
  
You have the following sub-folders within it:
- tf_dfw
  - These are the DRES/customer files/folders
    - 200-services
      - Services that must be created
    - 201-groups
      - Groups that must be created
    - 202-dfw
      - Firewall rules that must be created
- tf_gw
  - In here you'll find all the files for all the firewall rules that eventually you'll need to add them to your gateway
- tf_shared
  - Shared resources that are required
  
### 5. Copy the required Terraform files
Please note that the parse script will NOT copy the **"202-dfw"** folder from the "migration_projects" to the "projects" folder where it should go. 
   
The **"tf_gw"** files are also not copied automatically by the parse script, which means that you must check if you need them or not, and manually copy them to the right location.

A quick summary is, the following files/folders must be manually copied to their correct locations prior to run the Terraform injection
- /SOURCE > migration_projects > {geography} > {your_project_name} > terraform > tf_dfw > 202-dfw
- /SOURCE > migration_projects > {geography} > {your_project_name} > terraform > tf_gw 