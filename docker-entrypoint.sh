#!/bin/sh

if [ -f /data/openrc.sh ]
then
    source /data/openrc.sh
fi

eval $@
