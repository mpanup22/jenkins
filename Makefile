## Before we start test that we have the mandatory executables available
##EXECUTABLES = git terraform
##K := $(foreach exec,$(EXECUTABLES),\
##$(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH, consider apt-get install $(exec)")))

.PHONY: plan

init:
	@echo "initialize remote state file"
	cd layers/$(LAYER) && \
	rm -rf .terraform/modules/ && \
	terraform init -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 

validate: init
	@echo "running terraform validate"
	cd layers/$(LAYER) && \
	terraform validate -var "access_key=$ access_key" -var "secret_key=$ secret_key" 

plan: validate
	@echo "running terraform plan"
	cd layers/$(LAYER) && \
	export AWS_ACCESS_KEY_ID="aws_accesskey"
        export AWS_SECRET_ACCESS_KEY="aws_secretkey"
	terraform plan -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 

apply: plan
	@echo "running terraform apply"
	cd layers/$(LAYER) && \
	terraform apply -var "access_key=$ access_key" -var "secret_key=$ secret_key" 

plan-destroy: validate
	@echo "running terraform plan -destroy"
	cd layers/$(LAYER) && \
	terraform plan -var -var "access_key=$ access_key" -var "secret_key=$ secret_key" 

destroy: init
	@echo "running terraform destroy"
	cd layers/$(LAYER) && \
	terraform destroy -var "access_key=$ access_key" -var "secret_key=$ secret_key" 

