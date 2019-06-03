# Build K8s Cluster using kubespray

>k8s version: 1.14.0

>kubespray version: 2.10.0

## edit `.ini` in your inventory

>my path: `kubespray\inventory\mycluster\inventory.ini`

`[all]` all node in your cluster

`[kube-master]` master node (using node name defined in `[all]`)

`[etcd]` etcd node (should be odd)

`[kube-node]` worker node

## build cluster

edit the `hosts` in `build.sh`

`./build.sh`