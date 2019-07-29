## Before we start test that we have the mandatory executables available
EXECUTABLES = git terraform
K := $(foreach exec,$(EXECUTABLES),\
$(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH, consider apt-get install $(exec)")))

.PHONY: plan

init:
	@echo "initialize remote state file"
	cd layers/$(LAYER) && \
	rm -rf .terraform/modules/ && \
	terraform init -reconfigure -no-color
validate: init
	@echo "running terraform validate"
	cd layers/$(LAYER) && \
	terraform validate -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 

plan: validate
	@echo "running terraform plan"
	cd layers/$(LAYER) && \
	terraform plan -var "aws_accesskey=$ access_key" -var "aws_secretkey=$ secret_key" 

apply: plan
	@echo "running terraform apply"
	cd layers/$(LAYER) && \
	terraform apply -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 

plan-destroy: validate
	@echo "running terraform plan -destroy"
	cd layers/$(LAYER) && \
	terraform plan -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 

destroy: init
	@echo "running terraform destroy"
	cd layers/$(LAYER) && \
	terraform destroy -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey" 
