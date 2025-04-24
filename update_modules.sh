#!/bin/bash

# Update GIT data
git submodule update --recursive --init
git submodule update --recursive --remote

# Variables and functions
DIR_HOME=$(cd "$(dirname "$0")" && pwd)
source "${DIR_HOME}/sh_examples/scripts/commonFunctions.sh"
SCRIPT_NAME=$(getJustStriptName "$0")
MY_BIN2_LOCATION="${DIR_HOME}/bin"

# Show basic script info
declare -A script_info
export script_info=(
	[name]="${SCRIPT_NAME}" 
	[location]="${DIR_HOME}" 
	[description]="Copy All new scripts" 
	[calling]="$0"
)
showScriptInfo

# Cleaning previous data
if [ $# -eq 1 ] && [ "$1" == "-c" ] ; then
    echo "Cleaning previous data"
    rm -f "${MY_BIN2_LOCATION}/"*.sh
    rm -f "${MY_BIN2_LOCATION}/"*.py
fi

# Copy all files
echo "Copying SSH examples"
cp -f "${DIR_HOME}/sh_examples/scripts/"*.sh "${MY_BIN2_LOCATION}/"
echo "Copying Python3 examples"
cp -f "${DIR_HOME}/python3_examples/src/"*.py "${MY_BIN2_LOCATION}/"
cp -f "${DIR_HOME}/python3_examples/"*.conf "${MY_BIN2_LOCATION}/"

# Add execution permissions
chmod +x "${MY_BIN2_LOCATION}/"*.sh
chmod +x "${MY_BIN2_LOCATION}/"*.py
