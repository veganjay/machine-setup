#!/bin/sh

RESULTS_DIR="$HOME/rawdata/portscan"
OUTPUT_PREFIX="targets"

if [ $# != 1 ]
then
    echo Usage $0: filename
    exit 1
fi
TARGET_LIST="$1"

set -u
set -x

if [ ! -d "$RESULTS_DIR" ]
then
    mkdir -p "$RESULTS_DIR"
    echo Creating $RESULTS_DIR
fi

cd "${RESULTS_DIR}"

sudo nmap -vv -sS -sV -p- -sC -O -iL "${TARGET_LIST}" -oA "${OUTPUT_PREFIX}"
