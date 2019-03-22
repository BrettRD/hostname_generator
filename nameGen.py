#!/usr/bin/python3

import random
import time
names_file = "fantasy_names.txt"
adjectives_file = "adjectives.txt"



#take input on terminal, use as random seed

#random.seed( 30 )

#count lines in fantasy-names.txt
names_list = []
with open(names_file) as f:
	names_list = f.readlines()
names_list = [x.strip() for x in names_list]

name_count = len(names_list)


#count lines in adjectives.txt
adjectives_list = []
with open(adjectives_file) as f:
	adjectives_list = f.readlines()
adjectives_list = [x.strip() for x in adjectives_list] 
adjective_count = len(adjectives_list)


def genName():
	name_index = random.randrange(name_count)
	adjective_index = random.randrange(adjective_count)

	name = names_list[name_index]
	adjective = adjectives_list[adjective_index]

	#generate random numbers in a range

	full_name = name + " the " + adjective
	return full_name



while True:
	time.sleep(2)
	full_name = genName()
	print("Introducing,  " + full_name + "!\n")

