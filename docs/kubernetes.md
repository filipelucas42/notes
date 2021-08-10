# kubernetes

Run k8s locally with `kind`

## components
* api server
* etcd
* kubelet
* container runtime
* controller
* scheduler

## kubectl

* get current context: `kubectl conffig current-context`

## configuration

### basic config
required yaml fields:
```
# example
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
    labels:
        app: myapp
spcec:
    containers:
        - name: nginx-container
          image: nginx
```
