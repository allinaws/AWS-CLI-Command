#!/bin/bash

#set log
export NODENAME=`uname -n`
export DATE=`date "+%Y%m%d"`
export WORKDIR=$(cd $(dirname $0); pwd)
export LOGDIR=${WORKDIR}/log/${DATE}
