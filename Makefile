dev-init:
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/dev/state.tfvars

dev-plan:
	terraform init 
	terraform plan -var-file=./environments/dev/main.tfvars

dev-apply:
	terraform init												
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars

dev-destroy:
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars

prod-init:
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/prod/state.tfvars

prod-plan:
	terraform init 
	terraform plan -var-file=./environments/prod/main.tfvars

prod-apply:
	terraform init												
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars

prod-destroy:
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars