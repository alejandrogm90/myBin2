#!/bin/bash

# Update GIT data
git submodule update --recursive --init
git submodule update --recursive --remote

# Varables and functions
DIR_HOME=$(cd `dirname $0` && pwd)
source "${DIR_HOME}/sh_examples/scripts/commonFunctions.sh"
SCRIPT_NAME=`getJustStriptName $0`
MYBIN2_LOCATION="${DIR_HOME}/bin"

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
    rm -f "${MYBIN2_LOCATION}/"*.sh
    rm -f "${MYBIN2_LOCATION}/"*.py
fi

# Copy all files
echo "Copying SSH examples"
cp -f "${DIR_HOME}/sh_examples/scripts/"*.sh "${MYBIN2_LOCATION}/"
echo "Copying Python3 examples"
cp -f "${DIR_HOME}/python3_examples/src/"*.py "${MYBIN2_LOCATION}/"
cp -f "${DIR_HOME}/python3_examples/"*.conf "${MYBIN2_LOCATION}/"

# Add execution permissions
chmod +x "${MYBIN2_LOCATION}/"*.sh
chmod +x "${MYBIN2_LOCATION}/"*.py
