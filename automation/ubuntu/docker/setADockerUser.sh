#!/bin/bash

function getMyfileName() {
    FILENAME=`basename $0`
    FILENAME_FULL_PATH=`pwd`/${FILENAME}
}

function setADockerUser() {
    USERS_TO_ADD_IN_DOCKER=$@

    for user in $USERS_TO_ADD_IN_DOCKER
    do
    	  usermod -aG docker ${user}
    done
}

function main() {
    getMyfileName
    setADockerUser $@
}

function removeExecutableRight() {
    chmod -R -x+X $@
}

function removeEnvVariable() {
    unset $@
}

function onFinish {
    echo "End"
    #removeExecutableRight $FILENAME_FULL_PATH
    #removeEnvVariable FILENAME FILENAME_FULL_PATH
}

trap onFinish EXIT
main $@
