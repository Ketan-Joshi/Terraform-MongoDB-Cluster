#!/bin/bash

echo -n "primary.$1, " >> $3/mongodb_endpoint.txt
for (( i=1; i<=$2; i++ ))
do
    echo -n "secondary$i.$1, " >> $3/mongodb_endpoint.txt
done