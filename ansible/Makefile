galaxy-install:
	ansible-galaxy collection install -r requirements.yml
	ansible-galaxy role install -r requirements.yml

encrypt:
	ansible-vault encrypt_string '$(S)' --name '$(N)' --vault-password-file ./tmp/ansible-vault-password

setup-servers:
	ansible-playbook -i ./inventories/hosts playbook.yml --vault-password-file ./tmp/ansible-vault-password --tags "provision-webservers"

deploy:
	ansible-playbook -i ./inventories/hosts playbook.yml --vault-password-file ./tmp/ansible-vault-password --tags "deploy"

install-monitoring:
	ansible-playbook -i ./inventories/hosts playbook.yml --vault-password-file ./tmp/ansible-vault-password --tags "monitoring"
