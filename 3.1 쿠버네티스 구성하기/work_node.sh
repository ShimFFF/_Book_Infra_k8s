#!/usr/bin/env bash

# config for work_nodes only 
kubeadm join --token 123456.1234567890123456 \   # 마스터 노드에서 kubeadm init 명령어를 통해 생성된 토큰을 사용하여 워커 노드를 마스터 노드에 등록
             --discovery-token-unsafe-skip-ca-verification 192.168.1.10:6443   # 마스터 노드의 IP 주소와 포트 번호를 입력하여 마스터 노드에 등록