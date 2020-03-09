#!/bin/bash

function load_compose_env() {
    DOCKER_COMPOSE_REPO="https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)"
    DOCKER_COMPOSE_LOCATION_SYSTEM=/usr/local/bin/docker-compose
    DOCKER_COMPOSE_PUBLIC_REPO=/usr/bin/docker-compose
}

function install_docker_compose() {
    curl -L ${DOCKER_COMPOSE_REPO} -o ${DOCKER_COMPOSE_LOCATION_SYSTEM}
    chmod +x ${DOCKER_COMPOSE_LOCATION_SYSTEM}
    if test -f ${DOCKER_COMPOSE_LOCATION_SYSTEM}; then
        echo 'docker-compose exist'
    else
        ln -s ${DOCKER_COMPOSE_LOCATION_SYSTEM} /usr/bin/docker-compose
    fi
}

function main() {
    load_compose_env
    install_docker_compose
}

main
