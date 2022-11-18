#!/bin/bash

# Removing old data
truncate -s 0 $3/mongodb_endpoint.txt

# Adding new data
if [ $4 = true ]
then
    echo -n "mongo1$1, " >> $3/mongodb_endpoint.txt
    for (( i=1; i<=$2; i++ ))
    do
        echo -n "mongo$(expr $i + 1)$1, " >> $3/mongodb_endpoint.txt
    done
else
    echo -n "mongo1, " >> $3/mongodb_endpoint.txt
    for (( i=1; i<=$2; i++ ))
    do
        echo -n "mongo$(expr $i + 1), " >> $3/mongodb_endpoint.txt
    done
fi