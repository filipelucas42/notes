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

* get current context: `kubectl config current-context`
* imperative command: `kubectl apply ...`
* declarative command: `kubectl create ...`
* delete job: `kubectl delete jobs <job_name>`
* check pod logs: `kubectl logs -f <pod_name>`
* get deployments:  `kubectl get deploy`
* deletye deploy: `kubectl delete deploy`

## Commands
### Define default namespace
`k config set-context --current --namespace=<namespace>`

### Port Forward
- kubectl -n <namespace> port-forward svc/<service_name> <local_port>:<service_port>

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

## Use pod to access pvc
- Create temporary pod:
```
apiVersion: v1
kind: Pod
metadata:
  name: pvc-access
  namespace: <your-namespace> # Replace with your namespace
spec:
  containers:
    - name: pvc-access-container
      image: busybox
      command: ["/bin/sh", "-c", "sleep infinity"]
      volumeMounts:
        - name: pvc-storage
          mountPath: /mnt/pvc
  volumes:
    - name: pvc-storage
      persistentVolumeClaim:
        claimName: <your-pvc-name> # Replace with your PVC name
```
- kubectl cp <local-file-path> <namespace>/pvc-access:/mnt/pvc
