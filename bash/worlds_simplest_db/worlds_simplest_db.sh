#!/bin/bash

#Usage:
#
# Inserting a record: db_set 1 '{}'
# Getting a record: db_get 1

touch database

db_set() {
	echo "$1,$2" >> database
}

db_get() {
	grep "^$1," database | sed -e "s/^$1,//" | tail -n 1
}
