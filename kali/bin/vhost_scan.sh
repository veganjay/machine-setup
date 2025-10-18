#!/bin/sh

WORDLIST=/usr/share/seclists/Discovery/DNS/subdomains-top1million-110000.txt 

set -x
exec gobuster vhost --append-domain --wordlist="$WORDLIST" $@
