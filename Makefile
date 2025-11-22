dev-init:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/dev/state.tfvars

dev-plan:
	terraform init 
	terraform plan -var-file=./environments/dev/main.tfvars

dev-apply: dev-init
	terraform init												
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars

dev-destroy: dev-init
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars

prod-init:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/prod/state.tfvars

prod-plan:
	terraform init 
	terraform plan -var-file=./environments/prod/main.tfvars

prod-apply: prod-init
	terraform init												
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars

prod-destroy: prod-init
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars

tools-infra:
	cd tools
	terraform init -backend-config=./environments/tools/state.tfvars
	terraform plan -auto-approve -var-file=../environments/tools/main.tfvars