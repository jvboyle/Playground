
# Step 1) Update Docker-compose.yml 
Update ONLY these variables below:  
- source  
- USER_ID
- NSXT_MANAGER_HOST  
- NSXT_USERNAME  
- NSXT_PASSWORD  
  
Example:  
&nbsp;&nbsp;&nbsp;&nbsp;volumes:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;source: c://KSTP//GIT//KSTP-Terraform  
&nbsp;&nbsp;&nbsp;&nbsp;environment:  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- NSXT_MANAGER_HOST="10.63.70.200"  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- NSXT_USERNAME="myid@ag1.sp.ibm.local"  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- NSXT_PASSWORD="123abc"  

IMPORTANT:  
1) Please note that there is no space after the '=' sign within the 'environment:' section   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Wrong&nbsp;&nbsp;-> NSXT_MANAGER_HOST= "10.63.70.200"  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Correct&nbsp;-> NSXT_MANAGER_HOST="10.63.70.200"  
  
2) 'source' must point to your local cloned 'KSTP-Terraform' folder  
# Step 2) Build Container 
For Linux/MacOS users: run the 'build-image.sh', or the command below  
For Windows users: docker build -t kstp-docker-terraform-deploy-vpn .  

# Step 3) Run the container with 
docker-compose run --rm terraform-deploy-vpn

1st run , generate the keys for wireguard 
cd /SOURCE/kstp-terraform/sshuttle-container/wireguard

wg genkey | tee privatekey | wg pubkey > publickey

# - DO NOT COMMIT YOUR KEYS, USERNAME and PASSWORDS - # 