#!/bin/bash

function load_env() {
  AUTOMATION_PATH=/automation/ubuntu
  AUTOMATION_FILE=minikube
}

function add_kube_repo() {
    apt-get update && apt-get install -y apt-transport-https curl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    chmod +x ${AUTOMATION_PATH}/${AUTOMATION_FILE}/EOFProd.sh
    ${AUTOMATION_PATH}/${AUTOMATION_FILE}/EOFProd.sh
    apt update
    #apt-get install -y kubelet kubeadm kubectl
    #apt-mark hold kubelet kubeadm kubectl
}

function install() {
    apt update
    apt install -y kubelet kubeadm
    apt-mark hold kubelet kubeadm
}

function main(){
    load_env
    add_kube_repo
    install
}

main
