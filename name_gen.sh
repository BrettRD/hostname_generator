#!/bin/bash

#hash the seed and convert the hex to a decimal value (string format)
#this allows the seed to be any data source, including incrementing values and still span most of the namespace.
RND_SEED=$1
RND_NUM=$(echo "ibase=16;$(echo $RND_SEED | md5sum | sed 's/-//' | tr a-z A-Z)" | bc)
#echo $RND_NUM


NUM_ADJ=$(cat adjectives.txt | wc -l)
#echo $NUM_ADJ
NUM_NAM=$(cat fantasy_names.txt | wc -l)
#echo $NUM_NAM
ADJ_IDX=$(echo "$RND_NUM%$NUM_ADJ" | bc)
NAM_IDX=$(echo "($RND_NUM/$NUM_ADJ)%$NUM_NAM" | bc)
#echo $ADJ_IDX
#echo $NAM_IDX


NAM_STR=$(head -n$NAM_IDX fantasy_names.txt | tail -n1)
ADJ_STR=$(head -n$ADJ_IDX adjectives.txt | tail -n1)
RND_NAME="$NAM_STR the $ADJ_STR"
RND_HOSTNAME=$(echo "$RND_NAME" | sed "s/ /-/g" | tr A-Z a-z)
#echo "introducing $RND_NAME"
echo "$RND_HOSTNAME"
