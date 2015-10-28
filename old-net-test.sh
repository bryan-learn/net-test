#!/bin/bash
source ntlibs.sh

# read configuration and create variables
eval $(parse_yaml net-test.conf 'ntCONF_')

# get all variables added by config
set -o posix
set | grep "^ntCONF_"

END=$ntCONF_host_count
echo $END

set | grep "^ntCONF_hosts_.*_interface_count"


### Ping-All Test ##
#echo "## Ping-all tests: start" | tee -a $log
#
# for i in $(eval echo "{1..$END}"); do
#  ping -c 3 $($ntCONF_$i_ip) | tee -a $log
#  echo -e "---\n" | tee -a $log
#done
#
#wait
#echo -e "## Ping-all tests: complete\n\n" | tee -a $log
#--
