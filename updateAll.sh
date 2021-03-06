#!/bin/bash

# VARIABLES Y FUNCONES
DIR_HOME=$(cd `dirname $0` && pwd)

if [ -f "${DIR_HOME}/ssh_examples/scripts/commonFunctions.sh" ] ; then
    git submodule sync
    git submodule update --init --recursive
    git pull --recurse-submodules
else 
    git submodule sync
    git submodule update --init --recursive
fi

source "${DIR_HOME}/ssh_examples/scripts/commonFunctions.sh"
SCRIPT_NAME=`getJustStriptName $0`
export LOG_FILE="current_log"

declare -A script_info
export script_info=(
	[name]="${SCRIPT_NAME}" 
	[location]="${DIR_HOME}" 
	[description]="Copy All new scripts" 
	[calling]="./`getStriptName $0` yyyymmdd"
)

showScriptInfo

MYBIN2_LOCATION="${DIR_HOME}/bin"

if [ $# -eq 1 ] && [ "$1" == "clean" ] ; then
    rm ${MYBIN2_LOCATION}/*
    echo "" > ${MYBIN2_LOCATION}/.gitkeep 
fi

# Copy all files
echo "Copying SSH examples"
cp -f "${DIR_HOME}/ssh_examples/scripts/"*.sh "${MYBIN2_LOCATION}/"
echo "Copying Python3 examples"
cp -f "${DIR_HOME}/python3_examples/"*.py "${MYBIN2_LOCATION}/"

# Add execution permissions
chmod +x ${MYBIN2_LOCATION}/*

