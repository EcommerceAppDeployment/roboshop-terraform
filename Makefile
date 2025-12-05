dev-init:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/dev/state.tfvars

dev-plan: dev-init
	terraform init 
	terraform plan -var-file=./environments/dev/main.tfvars -var token=$(token)

dev-apply: dev-init
	terraform init												
	terraform apply -auto-approve -var-file=./environments/dev/main.tfvars -var token=$(token)

dev-destroy: dev-init
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/dev/main.tfvars -var token=$(token)

prod-init:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=./environments/prod/state.tfvars

prod-plan: prod-init
	terraform init 
	terraform plan -var-file=./environments/prod/main.tfvars -var token=$(token)

prod-apply: prod-init
	terraform init												
	terraform apply -auto-approve -var-file=./environments/prod/main.tfvars -var token=$(token)

prod-destroy: prod-init
	terraform init												
	terraform destroy -auto-approve -var-file=./environments/prod/main.tfvars -var token=$(token)

tools-infra:
	git pull
	cd tools; rm -f .terraform/terraform.tfstate; terraform init -backend-config=../environments/tools/state.tfvars; terraform apply -auto-approve -var-file="../environments/tools/main.tfvars" -var token=$(token)