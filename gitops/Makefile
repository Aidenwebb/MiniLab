.POSIX:

default: namespace argocd

gen-namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml > namespace-argocd.yml

namespace: gen-namespace
	kubectl apply -f namespace-argocd.yml

.PHONY: argocd
argocd:
	helm repo add argo https://argoproj.github.io/argo-helm
	helm repo update
	helm install argocd argo/argo-cd -n argocd --create-namespace --version 5.27.5
