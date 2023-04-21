# Installation

## Create a dedicated namesplace

```bash
kubectl apply -f ns.yaml
```

## Allocate storage, and setup nfs provisioner

Some folders esp. `xfer` needs to be mounted in more than one pods (probabily in different nodes). We use nfs provisioner to tackle it.

```bash
kubectl apply -f storage.yaml
```

Afterward use kubectl edit object to change the reclaim attribute: `persistentVolumeReclaimPolicy: Retain`.

```bash
kubectl apply -f nfs_serviceaccount.yaml
kubectl apply -f nfs_clusterrole.yaml
kubectl apply -f nfs_clusterrolebinding.yaml
kubectl apply -f nfs_role.yaml
kubectl apply -f nfs_rolebinding.yaml
kubectl apply -f nfs_storageclass.yaml
kubectl apply -f nfs_deployments.yaml
kubectl apply -f nfs_service.yaml
```

### Request for common storage accrross services

```bash
kubectl apply -f nfs_storage.yaml
```
Next use kubectl edit to change pvc attribute: `persistentVolumeReclaimPolicy: Retain`.

## Launch containers

### For interactive sessions

```bash
kubectl apply -f shell.yaml
```

### Production database server

```bash
kubectl apply -f secret.yaml
kubectl apply -f prod.yaml
```

## Ingress nginx for access report application

Docs:
* [ingress-nginx](https://kubernetes.github.io/ingress-nginx/deploy/)
* [ingress-nginx deployment](https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.0/deploy/static/provider/cloud/deploy.yaml)

```bash
kubectl apply -f ingress_deploy.yaml
kubectl apply -f tls.yaml
kubectl apply -f report_svc.yaml
kubectl apply -f report_ingress.yaml
```
