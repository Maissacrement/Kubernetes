#!/bin/bash

function init_env() {
    OS_TYPE=`cat /etc/os-release | grep ID_LIKE | awk -F '=' '{ print $2 }'`
}

function execute_good_script() {
    case $OS_TYPE in
    debian)
      echo "Run debian installation"
      ;;
    arch)
      echo "Run arch installation"
      ;;
    *)
      echo "This is not implemented yet"
      ;;
    esac
}

function main() {
    init_env
    execute_good_script
}

main
