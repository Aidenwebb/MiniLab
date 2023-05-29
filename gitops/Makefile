.POSIX:

default: namespace argocd

gen-namespace:
	kubectl create namespace argocd --dry-run=client --output=yaml > namespace-argocd.yml

namespace: gen-namespace
	kubectl apply -f namespace-argocd.yml

argocd:
	kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

