#!/bin/bash
ARTIFACT_NAME="simpleScript-5.0"
DEVICE_TYPE=" x86_64"
OUTPUT_PATH="output/simpleScript-4-5.0_x86_64_failes.mender"
FILE="input/scriptVR3-5.sh"      #YOU SHOULD HAVE `input` DIR and the script file

#The mender binary should be present in the `~/.trove` dir
~/.trove/mender-artifact write module-image --artifact-name-depends simpleScript-3.0 --type script --file ${FILE}  -o ${OUTPUT_PATH} -n ${ARTIFACT_NAME} -t ${DEVICE_TYPE}
