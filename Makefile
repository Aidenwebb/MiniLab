.POSIX:
.PHONY: *

default: baremetal

baremetal: 
	@echo "Building baremetal..."
	make -C baremetal