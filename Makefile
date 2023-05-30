.POSIX:
.PHONY: *
.EXPORT_ALL_VARIABLES:

env ?= prod
KUBECONFIG ?= $(shell pwd)/kubernetes/outputs/kubeconfig-$(env).yaml
KUBE_CONFIG_PATH = $(KUBECONFIG)

default: kubernetes #gitops

kubernetes: 
	@echo "Building kubernetes"
	make -C kubernetes

gitops:
	@echo "Building gitops"
	make -C kubernetes gitops