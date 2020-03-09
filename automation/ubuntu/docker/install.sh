#!/bin/bash

function run_installation() {
  echo -e 'Add executable right for: installDocker.sh, installDockerCompose.sh, setADockerUser.sh'
  chmod +x /automation/ubuntu/docker/{installDocker,installDockerCompose,setADockerUser}.sh
  echo -e 'Install docker\n'
  /automation/ubuntu/docker/installDocker.sh
  echo -e 'Install docker compose\n'
  /automation/ubuntu/docker/installDockerCompose.sh
}

function main() {
  run_installation
}

function remove_env_variable() {
  unset $@
}

function finish {
  echo "Remove write access linux"
  chmod -x /automation/ubuntu/docker/{installDocker,installDockerCompose,setADockerUser}.sh
}

trap finish EXIT
main
