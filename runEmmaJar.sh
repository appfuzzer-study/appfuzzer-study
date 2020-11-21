#!/bin/bash
if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters!"
    echo "usage: bash ./runEmmaJar.sh <target-Jar> <mainClass in target-Jar>"
    exit 2
fi

targetJar=$1
mainClass=$2

java -cp emma.jar emma instr -m overwrite -cp $targetJar

java -XX:-UseSplitVerifier -cp $targetJar:emma.jar $mainClass

java -cp emma.jar emma report -r html -in coverage.em,coverage.ec
