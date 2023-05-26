.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

default: kubernetes

kubernetes: 
	@echo "Building kubernetes"
	make -C kubernetes