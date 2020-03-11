#!/bin/bash

function load_env() {
  AUTOMATION_PATH=/automation/ubuntu
  AUTOMATION_FILE=minikube
}

function run_installation() {
  echo -e 'Add executable right\n'
  chmod +x ${AUTOMATION_PATH}/${AUTOMATION_FILE}/{installMinikube,installKubectl,installKubeProd}.sh
  echo -e 'Install minikube\n'
  ${AUTOMATION_PATH}/${AUTOMATION_FILE}/installMinikube.sh
  echo -e 'Install kubectl\n'
  ${AUTOMATION_PATH}/${AUTOMATION_FILE}/installKubectl.sh
  echo -e 'Install kubelet kubeadm\n'
  ${AUTOMATION_PATH}/${AUTOMATION_FILE}/installKubeProd.sh
}

function main() {
  load_env
  run_installation
}

function finish() {
  echo "Remove executable right linux"
  chmod -x ${AUTOMATION_PATH}/${AUTOMATION_FILE}/installMinikube.sh
}

trap finish EXIT
main
