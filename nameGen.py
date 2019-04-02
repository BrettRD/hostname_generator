#!/usr/bin/python3

import random
import time
import string
import math
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


#approximation to the Birthday Problem
def collision_probability(space_size, deployment_size):
	probability = 1-math.exp((-(deployment_size**2))/(2.0*space_size))
	return probability


def genName():
	name_index = random.randrange(name_count)
	adjective_index = random.randrange(adjective_count)

	name = names_list[name_index]
	adjective = adjectives_list[adjective_index]

	#generate random numbers in a range

	full_name = name + " the " + adjective
	return full_name


#for name in names_list:
#	if name.lower() in adjectives_list:
#		print(name)
space_size = name_count * adjective_count
print("the name space has a size of " + str(space_size))

#print some stats on deployment sizes
step_factor = 3;
deployment_size=step_factor
while deployment_size<space_size:
    print("the chance of a name collision with a deployment size of " + str(deployment_size) + " is approximately " + str(collision_probability(space_size, deployment_size)))
    deployment_size = deployment_size*step_factor

#generate some names
while True:
	time.sleep(2)
	full_name = genName()
	print("Introducing,  " + full_name)

	hostname = full_name.replace(" ", "-").lower()
	print(hostname)

