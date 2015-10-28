#!/bin/bash

## change to script dir
#echo "Value of \$0 is : $0"
#echo "path to script : ${0%/*}"
apath=$(cd "${0%/*}" 2>/dev/null; echo "$PWD"/"${0##*/}")
#echo "absolutepath is : $apath"
dname=$(dirname $apath)
#echo "directory name : $dname"
cd $dname

## load external libs
source ntlibs.sh

## load values from test configuration
#TODO check if $1 exists
eval $(parse_yaml conf/$1 'ntCONF_')
#TODO error checking


## load values from service configuration
eval $(parse_yaml conf/$ntCONF_test_service 'ntCONF_')

## load values from host configuration
eval $(parse_yaml conf/$ntCONF_test_host 'ntCONF_')

## substitute argument variables
#host ip
ntCONF_service_cmd=$(sed -e "s/@host_ip/$ntCONF_host_ip/g" <<< "$ntCONF_service_cmd")

#service port
serv_port="ntCONF_host_service_$ntCONF_service_name"
serv_port=$serv_port"_port"
#echo $serv_port
#echo "${!serv_port}"
ntCONF_service_cmd=$(sed -e "s/@service_port/${!serv_port}/g" <<< "$ntCONF_service_cmd")

## print all variables added by config
#set -o posix
#set | grep "^ntCONF_"

## run service test and log output
echo "Testing: .."
echo "  output: $dname/$ntCONF_test_output"
echo "  command: $ntCONF_service_cmd"
$ntCONF_service_cmd > $ntCONF_test_output
