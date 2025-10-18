#!/bin/sh

PORTS="1-65535"

if [ $# != 1 ]
then
    echo Usage: $0 target
    exit
fi

TARGET="$1"
TARGET_STRING=$(echo $TARGET | sed -e 's/\//_/')
RESULTS_DIR=$HOME/rawdata/portscan

if [ ! -d $RESULTS_DIR ]
then
    mkdir -p $RESULTS_DIR
    echo Creating $RESULTS_DIR
fi

cd $RESULTS_DIR
set -u
set -x
# Flags:
# no name resolution, SYN scan, enable scripts, version detection, OS detection, normal timing, verbose, all output formats
sudo nmap -n -p $PORTS -sS -sC -sV -O -T3 -oA $TARGET_STRING $TARGET
