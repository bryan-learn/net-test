#!/bin/bash

# cd to script's dir
apath=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
dname=$(dirname $apath)
cd $dname

./net-test.sh -s ping.serv -h tango.host -o ping-all.log
./net-test.sh -s ping.serv -h rumba.host -o ping-all.log
./net-test.sh -s ping.serv -h mambo.host -o ping-all.log
#./net-test.sh -s ping.serv -h psarch.host -o ping-all.log
./net-test.sh -s ping.serv -h giu3.host -o ping-all.log
./net-test.sh -s ping.serv -h tenge.host -o ping-all.log
