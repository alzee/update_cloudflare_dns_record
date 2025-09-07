#!/bin/bash
#
# vim:ft=sh

############### Variables ###############

############### Functions ###############

############### Main Part ###############
dir=$(dirname $0)
. $dir/.env

url="https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records/$RECORD_ID"
method=GET
method=PATCH
logfile=$dir/cloudflare_dns_record.log

ip=$(curl -4 -s $IPCHECKER)

curl -s -X $method $url \
     -H "Authorization: Bearer $TOKEN" \
     -H "Content-Type:application/json" \
  --data "{
  \"content\": \"$ip\",
  \"name\": \"$RECORD_NAME\",
  \"proxied\": false,
  \"type\": \"A\",
  \"comment\": \"updated(vm startup): $(date)\",
  \"tags\": [],
  \"ttl\": 1
}" >> $logfile

echo >> $logfile
