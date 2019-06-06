# Build K8s Cluster using kubespray

>k8s version: 1.13.5 & kubespray version: 2.9.0

>k8s version: 1.14.0 & kubespray version: 2.10.0

## edit `.ini` in your inventory

>my path: `kube-x.xx.x/kubespray/inventory/mycluster/inventory.ini`

`[all]` all node in your cluster

`[kube-master]` master node (using node name defined in `[all]`)

`[etcd]` etcd node (should be odd)

`[kube-node]` worker node

## verify the calico mtu

>my path: `kube-x.xx.x/kubespray/inventory/mycluster/group_vars/k8s-cluster/k8s-net-calico.yml`

Compute your MTU sizes based on your environment.

For me, I use OpenStack VXLAN and Calico MTU with IP-in-IP, so my mtu is 1430.

(If you use OpenStack VXLAN, you must modify this value, because OpenStack VXLAN will cut and drop the overlong package.)

## build cluster

edit the `hosts` in `build.sh`

`./build.sh`
