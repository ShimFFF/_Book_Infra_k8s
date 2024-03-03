#!/usr/bin/env bash

# init kubernetes 
kubeadm init --token 123456.1234567890123456 --token-ttl 0 \  # 토큰 생성
--pod-network-cidr=172.16.0.0/16 --apiserver-advertise-address=192.168.1.10   # 쿠버네티스 클러스터의 네트워크 대역을 설정하고 마스터 노드의 IP 주소를 입력하여 쿠버네티스 클러스터를 초기화

# config for master node only 
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config  # 마스터 노드의 설정 파일을 사용자 홈 디렉터리로 복사
chown $(id -u):$(id -g) $HOME/.kube/config   # 복사된 설정 파일의 소유자를 사용자로 변경

# config for kubernetes's network 
kubectl apply -f \  # 쿠버네티스 클러스터의 네트워크를 설정
https://raw.githubusercontent.com/sysnet4admin/IaC/master/manifests/172.16_net_calico.yaml  