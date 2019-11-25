#!/bin/bash

usage_message="Usage: ./setup_virtual_env.sh <virtual-env-name>"
if [ "$1" = "" ] || [ $# -lt 1 ]; then
	echo "Error: missing virtual environment name"
	echo $usage_message
	exit
fi
	
if [[ "$1" = *"--help"* ]] || [[ "$1" = *"-h"* ]]; then
	echo $usage_message
fi


virtual_env_name=$1
output=$(python3 -m venv $virtual_env_name)
success_message="Virtual Environment created successfully"

if [ $? -ne 0 ]; then
	echo "python3-venv not installed, installing now..."
	sudo apt-get install python3-venv
	python3 -m venv $virtual_env_name
	if [ $? -e 0 ]; then 
		echo $success_message
	else 
		echo "Something went wrong..."
	fi
else
	echo $success_message
fi
