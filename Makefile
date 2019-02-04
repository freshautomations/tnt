#Ansible requires a running SSH agent with the proper private key
#Terraform requires TESTNET, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY exported

all:
	@echo "Read the README.md"
.PHONY: all

# Config: Ansible playbooks: stop, status, config, reset, binary, start, ssh


set-hostname, datadog-config:
	@cd playbooks && time ansible-playbook ../bootstrap/$@.yml

%:
	@cd playbooks && time ansible-playbook ${ANSIBLE_FLAGS} $*.yml


# Infra: Terraform scripts: plan, apply, destroy

infra-%:
	@cd infra && terraform init && \
	(terraform workspace new $${TESTNET} || terraform workspace select $${TESTNET}) && \
	time terraform $* -var TESTNET=$${TESTNET}
