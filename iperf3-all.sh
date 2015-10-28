#!/bin/bash

# cd to script's dir
apath=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
dname=$(dirname $apath)
cd $dname

./net-test.sh -s iperf3.serv -h tango.host -o iperf3-all.log
./net-test.sh -s iperf3.serv -h rumba.host -o iperf3-all.log
./net-test.sh -s iperf3.serv -h mambo.host -o iperf3-all.log
#./net-test.sh -s iperf3.serv -h psarch.host -o iperf3-all.log
./net-test.sh -s iperf3.serv -h giu3.host -o iperf3-all.log
./net-test.sh -s iperf3.serv -h tenge.host -o iperf3-all.log
