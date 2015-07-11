#!/bin/sh
# Changes the hardware address of an interface.

ME=$(basename "$0")

if [ $(id -u) -ne 0 ]; then
   >&2 echo $ME must be run by root 
   exit 1
fi

if [ -z "$1" ]; then
   >&2 echo usage: $ME interface 
   exit 1
fi

if [ ! -d /sys/class/net/$1 ]; then
   >&2 echo $1 is not an interface
   exit 1
fi

ip link set dev $1 down
MAC=$(cat /sys/class/net/$1/address | cut -d':' -f1-3)$(hexdump -n3 -e '/1 ":%02X"' /dev/urandom)
ip link set dev $1 address $MAC
ip link set dev $1 up
