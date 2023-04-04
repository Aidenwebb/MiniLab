.POSIX:

env ?= "prod"

default: boot

~/.ssh/id_ed25519:
	ssh-keygen -t ed25519 -P '' -f "$@"

boot: ~/.ssh/id_ed25519
	ansible-playbook \
		--inventory inventories/$(env).yml \
		boot.yml
