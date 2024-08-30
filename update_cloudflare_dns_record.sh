#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############
dir=$(dirname $0)
. $dir/.env

url="https://api.cloudflare.com/client/v4/zones/$zone_id/dns_records/$record_id"
method=GET
method=PATCH
logfile=$dir/cloudflare_dns_record.log

ip=$(curl -s 'https://api.ipify.org')

curl -s -X $method $url \
     -H "Authorization: Bearer $token" \
     -H "Content-Type:application/json" \
  --data "{
  \"content\": \"$ip\",
  \"name\": \"alz.ee\",
  \"proxied\": false,
  \"type\": \"A\",
  \"comment\": \"aws hk\",
  \"tags\": [],
  \"ttl\": 1
}" >> $logfile

echo >> $logfile
