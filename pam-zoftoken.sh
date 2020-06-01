#!/usr/bin/env bash

## [USE]
## pam-zoftoken [service] [no_2fa_user] [auth_key] [host_zoftoken]
##

SERVICE=$1
NO_2FA_USER=$2
AUTH_KEY=$3
HOST_NAME=$4

if [ $PAM_USER == $NO_2FA_USER ]
then
    exit 0
fi

STATUS=$(curl -s "https://${HOST_NAME}/token/status?id=${PAM_USER}&service=${SERVICE}&authKey=${AUTH_KEY}"  | grep 1)

if [ -z "$STATUS" ]
then
    exit 1
else
    exit 0
fi