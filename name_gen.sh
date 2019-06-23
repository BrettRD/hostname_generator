#!/bin/bash

#find some unique entropy on the system,
#making sure the name can be repeatably generated.
MAC_IF="enp3s0"
ENTR_SRC=$(cat /sys/class/net/$MAC_IF/address)
RND_NUM=$(echo "ibase=16;$(echo $ENTR_SRC | md5sum | sed 's/-//' | tr a-z A-Z)" | bc)
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
RND_HOSTNAME=$(echo "$NAM_STR-the-$ADJ_STR" | tr A-Z a-a)
RND_NAME="$NAM_STR the $ADJ_STR"
echo "introducing $RND_NAME"
