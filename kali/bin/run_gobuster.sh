#!/bin/sh

WORDLIST_DIR=/usr/share/dirb/wordlists
WORDLIST=common.txt

if [ $# = 0 ]
then
    echo Usage: $0 URL
    exit 1
fi

if [ $# = 2 ]
then
    WORDLIST="$2"
fi

set -x

# Run Feroxbuster
feroxbuster --url $URL -w $WORDLIST

# Now try gobuster
gobuster dir -r --url "$1" --wordlist $WORDLIST_DIR/$WORDLIST
gobuster dir --discover-backup -r -x txt,pdf,config,db,sqlite,xlsx,xls,doc,docx --url "$1" --wordlist $WORDLIST_DIR/$WORDLIST
