# Copyright (c) 2019-2022 Oracle and/or its affiliates. All rights reserved.
# Licensed under the Universal Permissive License v 1.0 as shown at http://oss.oracle.com/licenses/upl.
# 

locals{
   site1= var.domain_name==""? format("https://%s.nip.io/%s/", oci_core_instance.app_instance[0].public_ip , local.guid): format("https://%s/%s/",var.domain_name,local.guid)
}
output "proxy_url" {
  value       = local.site1
  
}

output "lb_proxy_url" {
  value       = local.site1
  
}
output "dev" {
  value = "Made with \u2764 by Hiddify. Please wait for atleast 15 minutes to see the result. If you can see the webpage, it means that everything has been set up :D"
}



### Important Security Notice ###
# The private key generated by this resource will be stored unencrypted in your Terraform state file. 
# Use of this resource for production deployments is not recommended. 
# Instead, generate a private key file outside of Terraform and distribute it securely to the system where Terraform will be run.
output "generated_private_key_pem" {
  value     = var.generate_public_ssh_key ? tls_private_key.compute_ssh_key.private_key_pem : "No Keys Auto Generated"
  sensitive = true
}