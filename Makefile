.POSIX:
.PHONY: *

default: baremetal_pve

baremetal_pve: 
	@echo "Building baremetal_pve..."
	make -C baremetal_pve