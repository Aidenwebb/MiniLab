.POSIX:

env ?= "prod"

default: cluster

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -P '' -f "$@"

boot: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/$(env).yml \
		boot.yml

bootstrap: 
	ansible-playbook \
		--inventory inventories/$(env).yml \
		bootstrap_for_ansible.yml -k

cluster: 
	ansible-playbook \
		--inventory inventories/$(env).yml \
		cluster.yml