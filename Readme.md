AWS_PROFILE=sandbox terraform init  -reconfigure 

AWS_PROFILE=sandbox terraform plan -var-file environment-vars/varnotification.tfvars

AWS_PROFILE=sandbox terraform apply -var-file environment-vars/varnotification.tfvars
