
# Build Container 
cd To Docker Container Directory you want to build 
run the build-image.sh 
or
open the build-image.sh file and cut/paste the command 
#

# update Docker-compose.yml with your information to login to NSX

    environment:
      - NSXT_MANAGER_HOST="10.211.12.200"
      - NSXT_USERNAME="jboyle@ag1.sp.ibm.local"
      - NSXT_PASSWORD="PASSWORD"
  
# Run the container with 

docker-compose run --rm terraform-deploy

# - DO NOT COMMIT YOUR COMPOSE FIle with Values - # 
