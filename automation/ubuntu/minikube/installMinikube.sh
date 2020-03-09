#!/bin/bash

function load_env() {
  MINIKUBE_URL=https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  MINIKUBE_ROOT_PATH=/usr/local/bin/
}

function download_minikube() {
  echo -e 'Download minikube'
  curl -Lo minikube ${MINIKUBE_URL}
}

function install() {
  sudo mkdir -p ${MINIKUBE_ROOT_PATH}
  sudo install minikube ${MINIKUBE_ROOT_PATH}
}

function main() {
  load_env
  download_minikube
  install
}

main
