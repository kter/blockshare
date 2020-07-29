# Local

```
cd kube
kubectl create secret generic credentials --from-env-file ../.env
kubectl apply -f .
helm install nginx-ingress stable/nginx-ingress --set controller.publishService.enabled=true
```
# DigitalOcean (production)

They deployed by GitHub Actions after merged to master branch.

# DigitalOcean (production) from local execution (Not Recommended)

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
