#!/bin/bash
## macOS can get confused when using VPN especially with a lot of disconnects or network changes, the script flushes routes and restarts interface... and 'fixes' VPN reconnect macOS bug
#assumes en0 is default wireless NIC

#ask for root privs
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

#bring down interface flush and brig back up
ifconfig en0 down
sleep 1
route flush
ifconfig en0 up
