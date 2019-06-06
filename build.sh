# config verison
version=1.14.1
kubeDir=kube-${version}

# config hosts
hosts=(km-1 km-2 km-3 kn-1 kn-2 kn-3)

for host in ${hosts[@]}
do
    # distribute resources to each host
    scp -r ${kubeDir}/releases ${host}:/tmp/
    scp ${kubeDir}/kube.tar ${host}:~/

    # chomd
    ssh ${host} "sudo cp /tmp/releases/kubeadm /usr/local/bin/kubeadm"
    ssh ${host} "sudo chmod +x /usr/local/bin/kubeadm"

    # load images
    ssh ${host} "sudo docker load -i kube.tar"
done

# build cluster
ansible-playbook -i ${kubeDir}/kubespray/inventory/mycluster/inventory.ini --become --become-user=root ${kubeDir}/kubespray/cluster.yml

ssh ${hosts[0]} "mkdir ~/.kube/"
ssh ${hosts[0]} "sudo cp /etc/kubernetes/admin.conf ~/.kube/config"
ssh ${hosts[0]} "sudo chmod 666 ~/.kube/config"
scp ${hosts[0]}:~/.kube/config ~/.kube/config

