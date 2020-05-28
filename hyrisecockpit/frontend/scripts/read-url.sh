#!/bin/bash
globalEnv="../../../.env"
localEnv="../.env"

: > "$localEnv"

while IFS= read -r line
do
    if grep -q "BACKEND" <<< "$line"; 
    then 
    	echo "VUE_APP_${line}" >> "$localEnv"
    fi

done <"$globalEnv"