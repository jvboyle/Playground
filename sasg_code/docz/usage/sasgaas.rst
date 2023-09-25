Using SASGaaS
=============

Dashboard
---------

Main interface to interact SDS and create install scripts. Allows to create,
search for and remove customer records. Besides this allows to modify the
records but this mechanism is not very reliable.

**New Deployment** popup:

  * **Customer Name** - account name to be shown in SASGaaS. Keep it short but
    distinctive
  * **FW Account** - user name and name of ssh key to use for ssh'ing into
    account's SASFW. The latter is hidden beneath the asterisk. The values
    should be sasauto/sasauto as no other values are used at the moment
  * **Tools Account** - same as above but for tools machines. Should also
    be sasauto/sasauto
  * **Vars File** - allows selecting ``vars`` file from local machine to upload
    to SASGaaS and use the values from the file to connect to and setup
    machines
  * **Groups** - list of Bluepages groups accociated with the account (only
    members of the correspondent group will be able to access account)

Informational Columns:

  * **Customer Name** - name of the customer account as inputed initially
  * **Created** - date of account creation
  * **Script Version (Date)** - date when the FW/tools scripts were created
    and the version of the code they are based on
  * **FW Account | Passkey** - user/key to access SASFW machine
  * **Tools Account | Passkey** - user/key to access tools machines
  * **Vars** - link to download ``vars`` file
  * **FW (Logs)** - link to download sasfw setup script 
    (`sasg_vyos_configure.sh`) and the log of its last execution
  * **Tools (Logs)** - link to download tools setup script 
    (`sasg_tools_configure.sh`) and the log of their last execution per 
    machine
  * **SASG** - link to download SASG setup script (`sasg_install.sh`)
  * **Actions** - the button to select some actions from the list below

Actions:

  * **Configure Firewall** - download over ssh to account's SASFW
    configuration script and run it there. Upload log back to SASGaaS.
  * **Configure Tools** - download over ssh to account's tools
    configuration script and run it there. Upload log back to SASGaaS
    for every tools machine.
  * **Connectivity Checks** - try to connect to SASFW/tools machines and display
    the results of the attempt
  * **Run commands** - attempts to execute command(-s) on **SASFW** or **tools**
    machines. Appears not to be working as no ssh connection is registered on
    server when command is supposed to be run and no requested result produced.
    Commands are created on **Command** SASGaaS' page (see below).
  * **Regenerate Scripts** - recreate SASFW/tools setup scripts (e.g. to use 
    newer version of code to actualize setup)
  * **Modify** - change account, usually via uploading new ``vars`` file version
  * **Delete** - delete account. Plain and simple.


Command
-------

Allow to manage (create, update & delete) custom commands to run on **SASFW**
or **tools** machines.

**New Command** popup

  * **Command Name** - short command name
  * **Command Description** - extended info about command to allow people to
    know its purpose
  * **Command Content** - list of shell commands to run in scope of the 
    command

Docz
----

The root of the current documentation
