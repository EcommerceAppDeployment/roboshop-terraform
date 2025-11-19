dev-init:
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/dev/main.tfvars

dev-plan:
	terraform init 
	terraform plan -var-file=./environments/dev/main.tfvars

dev-apply:
	terraform init												
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars

dev-destroy:
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars
