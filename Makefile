## Before we start test that we have the mandatory executables available
##EXECUTABLES = git terraform
##K := $(foreach exec,$(EXECUTABLES),\
##$(if $(shell which $(exec)),some string,$(error "No $(exec) in PATH, consider apt-get install $(exec)")))

.PHONY: plan

init:
	@echo "initialize remote state file"
	sudo cd layers/$(LAYER) && \
	sudo rm -rf .terraform/modules/ && \
	sudo terraform init -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"

validate: init
	@echo "running terraform validate"
	sudo cd layers/$(LAYER) && \
	sudo terraform validate -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"

plan: validate
	@echo "running terraform plan"
	sudo cd layers/$(LAYER) && \
	sudo terraform plan -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"

apply: plan
	@echo "running terraform apply"
	sudo cd layers/$(LAYER) && \
	sudo terraform apply -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"

plan-destroy: validate
	@echo "running terraform plan -destroy"
	sudo cd layers/$(LAYER) && \
	sudo terraform plan -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"
destroy: init
	@echo "running terraform destroy"
	sudo cd layers/$(LAYER) && \
	sudo terraform destroy -var "aws_accesskey=$ aws_accesskey" -var "aws_secretkey=$ aws_secretkey"

