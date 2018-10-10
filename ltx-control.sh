#!/bin/bash

if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi

usage="./ltx-control.sh [arguments]"
VERBOSE=true
counter="0"

while getopts 'abcdefhklmnop?' option
do
  case "$option" in
  a) systemctl start ltx.service
     systemctl is-active ltx
     ((counter+=1))
     ;;
  b) systemctl stop ltx.service
     systemctl is-active ltx
     ((counter+=1))
     ;;
  c) systemctl status ltx.service
     ((counter+=1))
     ;;
  d) systemctl is-enabled ltx.service
     ((counter+=1))
     ;;
  e) ltx-cli mnsync status
     ((counter+=1))
     ;;
  f) ltx-cli masternode status
     ((counter+=1))
     ;;
  h) $usage
     ((counter+=1))
     ;; 
  k) ufw status
     ((counter+=1))
     ;;
  l) cat .ltx/ltx.conf
     ((counter+=1))
     ;;
  m) more /var/log/ufw.log
     ((counter+=1))
     ;;
  n) ltx-cli getinfo
     ((counter+=1))
     ;;
  o) ltx-cli getblockcount
     ((counter+=1))
     ;;
  p) ltx-cli getpeerinfo
     ((counter+=1))
     ;;
  ?) $usage
     exit 0
     ;;
  esac
done

if [ $counter -eq 1 ];then
  exit 0
else
  echo $usage
  exit 1
fi
