---
layout: post
title:  "Kubernetes"
date:   2021-01-24 13:00
categories: python
---
[Python](https://wikidocs.net/book/1553)
1. Step 1: Update Docker Package Database
  - yum check-update

2. Step 2: Install the Dependencies
  - yum install -y yum-utils device-mapper-persistent-data lvm2
  # Docker uses a device mapper storage driver, and the device-mapper-persistent-data and lvm2 packages are required for it to run correctly

3. Step 3: Add the Docker Repository to CentOS
  - yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

4. Step 4: Install Docker On CentOS Using Yum
  - yum install docker

5. Step: 5 Manage Docker Service
  - systemctl start docker
  - systemctl enable docker
  - systemctl status docker

6. Step 1: Configure Kubernetes Repository
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

7. Step 2: Install kubelet, kubeadm, and kubectl
  - yum install -y kubelet kubeadm kubectl
  - systemctl enable kubelet
  - systemctl start kubelet

8. Step 3: Set Hostname on Nodes
  # master node
  - hostnamectl set-hostname master-node
  #work node
  - hostnamectl set-hostname worker-node01
  - vi /etc/hosts

9. Step 4: Configure Firewall
   # host master
  - firewall-cmd --permanent --add-port=6443/tcp
  - firewall-cmd --permanent --add-port=2379-2380/tcp
  - firewall-cmd --permanent --add-port=10250/tcp
  - firewall-cmd --permanent --add-port=10251/tcp
  - firewall-cmd --permanent --add-port=10252/tcp
  - firewall-cmd --permanent --add-port=10255/tcp
  - firewall-cmd --reload
  # node
  - firewall-cmd --permanent --add-port=10251/tcp
  - firewall-cmd --permanent --add-port=10255/tcp
  - firewall-cmd --reload

10. Step 5: Update Iptables Settings
  - cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
  - sysctl --system

11. Step 6: Disable SELinux
  - setenforce 0
  - sed -i ‘s/^SELINUX=enforcing$/SELINUX=permissive/’ /etc/selinux/config

12. Step 7: Disable SWAP
  - sed -i '/swap/d' /etc/fstab
  - swapoff -a

#### How to Deploy a Kubernetes Cluster(host master) ###
13. Step 1: Create Cluster with kubeadm
  - kubeadm init --pod-network-cidr=10.244.0.0/16
  - export KUBECONFIG=/etc/kubernetes/admin.conf

14 Step 2: Manage Cluster as Regular User
  - mkdir -p $HOME/.kube
  - cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  - chown $(id -u):$(id -g) $HOME/.kube/config
  - export KUBECONFIG=$HOME/.kube/config

15. Step 3: Set Up Pod Network(flannel)
  - kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

16. Step 4: Check Status of Cluster
  - kubectl get nodes
  - kubectl get pods --all-namespaces
  
17. Step 5: Join Worker Node to Cluster
  - kubeadm join 192.168.10.182:6443 --token setf1p.u9fpmfa1rvzj3yfv \
    --discovery-token-ca-cert-hash sha256:ffa13dca2f921ea1e332f3991d4b4ee6c8cbf286515e01036ddddd4e2cd2215e
   1) 토큰을 모를 경우
     - kubeadm token list
   2) 토큰이 없는 경우 (기본 24시간 후 삭제)
     - kubeadm token create
   3) --discovery-token-ca-cert-hash를 모를 경우
     - openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | \ 
        openssl dgst -sha256 -hex | sed 's/^.* //'
