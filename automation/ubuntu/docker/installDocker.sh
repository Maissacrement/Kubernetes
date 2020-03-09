#!/bin/bash

function load_docker_env() {
  DOCKER_UBUNTU_GPG_KEY=https://download.docker.com/linux/ubuntu/gpg
  DOCKER_UBUNTU_REPO=https://download.docker.com/linux/ubuntu
}

function install_dependance() {
    apt-get update
    apt install -y apt-transport-https ca-certificates \
                    curl gnupg-agent software-properties-common
}

function get_docker() {
    apt-get update
    apt-get install -y docker-ce docker-ce-cli containerd.io
}

function install_docker() {
    curl -fsSL ${DOCKER_UBUNTU_GPG_KEY} | apt-key add -
    apt-key fingerprint 0EBFCD88
    add-apt-repository \
    "deb [arch=amd64] ${DOCKER_UBUNTU_REPO} \
    $(lsb_release -cs) \
    stable"
    get_docker
}

function start_deamon() {
    service $1 start
}


function main() {
    load_docker_env
    install_dependance
    install_docker

    start_deamon docker
}

function remove_env_variable() {
    unset $@
}

function finish {
    echo "end"
    exit 0
    #remove_env_variable "DOCKER_UBUNTU_REPO"
}

trap finish EXIT
main
