/*()
terraform {
  required_providers {
    phpipam = {
      source = "lord-kyron/phpipam"
      version = "1.2.8"
    }
  }
}

provider "phpipam" {
  app_id   = "terraform"
  endpoint = "https://10.211.121.87/api"
  password = var.phpipam_pass
  username = "Admin"
  insecure = true
}
*/

// select dres subet 
data "phpipam_subnet" "select" {
    subnet_address = "10.10.0.0"
    subnet_mask = 16
}

// get 1st availalb subnet 
data "phpipam_first_free_subnet" "next_dres" {
    subnet_id = data.phpipam_subnet.select.subnet_id
    subnet_mask = 25
}

output "subnet" {
  value = data.phpipam_first_free_subnet.next_dres.id
}