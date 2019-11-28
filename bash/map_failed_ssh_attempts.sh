#!/bin/bash

IP_ADDRESSES="$(cat /var/log/auth.log | grep 'Invalid user\|Failed password' \
	| grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')"

for ip in $IP_ADDRESSES; do
	curl -s https://ipvigilante.com/${ip} | \
	       	jq '.data.ipv4, .data.latitude, .data.longitude, .data.city_name, .data.subdivision_1_name, .data.country_name' | \
		while read -r IP; do
			read -r LATITUDE
			read -r LONGITUDE
			read -r CITY
			read -r STATE
			read -r COUNTRY
			echo "${IP},${LATITUDE},${LONGITUDE},${CITY},${STATE},${COUNTRY}"
		done
done
