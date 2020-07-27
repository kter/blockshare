# Local

```
cd kube
kubectl create secret generic credentials --from-env-file ../.env
kubectl apply -f .
```
