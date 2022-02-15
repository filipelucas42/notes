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
* imperative command: `kubectl apply ...`
* declarative command: `kubectl create ...`

## configuration

### basic config
required yaml fields (pod example):
```
# example
apiVersion: v1
kind: Pod
metadata:
    name: myapp-pod
    labels:
        app: myapp
spec:
    containers:
        - name: nginx-container
          image: nginx
```
Replication Controller config example:
```
apiVersion: v1
kind: ReplicationController
metadata:
    name: myapp-rc
spec:
    template:
        metadata:
            name: myapp-pod
            labels:
                app: myapp
        spec:
            containers:
                - name: nginx-container
                  image: nginx
    replicas: 3
```
Replica Set config example:
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
    name: myapp-rc
spec:
    template:
        metadata:
            name: myapp-pod
            labels:
                app: myapp
        spec:
            containers:
                - name: nginx-container
                  image: nginx
    replicas: 3
    selector:
        matchLabels:
            app: myapp

```
