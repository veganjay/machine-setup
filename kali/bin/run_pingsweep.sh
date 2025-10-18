#!/bin/sh

PORTS="1-65535"

if [ $# != 1 ]
then
    echo Usage: $0 target
    exit
fi

TARGET="$1"
TARGET_STRING=$(echo $TARGET | sed -e 's/\//_/')
RESULTS_DIR=$HOME/rawdata/pingsweep

if [ ! -d $RESULTS_DIR ]
then
    mkdir -p $RESULTS_DIR
    echo Creating $RESULTS_DIR
fi

cd $RESULTS_DIR
set -u
set -x
# Flags
# No DNS lookup, ping sweep, normal timing, verbose output all file formats
sudo nmap -n -sn -T3 -v -oA $TARGET_STRING $TARGET
