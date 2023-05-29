.POSIX:

env ?= prod

default: bootstrap cluster

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -P '' -f "$@"

bootstrap: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/${env}.yml \
		bootstrap.yml

cluster: ~/.ssh/id_ed25519
	ansible-playbook \
		--extra-vars="env=${env}" \
		--inventory inventories/${env}.yml \
		cluster.yml 