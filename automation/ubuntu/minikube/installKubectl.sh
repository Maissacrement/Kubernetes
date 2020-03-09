#!/bin/bash

function load_env() {
  KUBERNETES_URL=https://storage.googleapis.com/kubernetes-release/release
  KUBERNETES_VERSION=`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`
  KUBERNETES_PATH=bin/linux/amd64/kubectl
  KUBERNETES_FILE=kubectl
}

function download_kube() {
  echo 'Download kube'
  curl -Lo ./${KUBERNETES_FILE} ${KUBERNETES_URL}/${KUBERNETES_VERSION}/${KUBERNETES_PATH}
  chmod +x ./${KUBERNETES_FILE}
}

function install() {
  echo -e 'Add kubectl for loacl user\n'
  sudo mv ./${KUBERNETES_FILE} /usr/local/bin/${KUBERNETES_FILE}
  kubectl version --client
}

function main() {
  load_env
  download_kube
  install
}

function finish() {
  echo "End kubectl installation"
}

trap finish EXIT
main
