# Local

```
cd kube
kubectl create secret generic credentials --from-env-file ../.env
kubectl apply -f .
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```
# DigitalOcean from local execution

Fill the credentials in ../.env-prd

```
cd kube
# update kubectl config
doctl kubernetes cluster kubeconfig save blockshare
# env
kubectl create secret generic credentials --from-env-file ../.env-prd
kubectl apply -f config-map.yml
kubectl apply -f db-preparation.yml
kubectl apply -f lb.yml
kubectl apply -f main.yml
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```
