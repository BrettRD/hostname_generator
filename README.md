# hostname_generator
A deterministic generator of random hostnames.

A trivial rule and a seeded random number generator allow a human-readable hostname to be associated with a given physical machine,
or a given (re)deployment of VMs

The birthday problem is unkind to very large deployments, pull requests welcome to expand the lists or expand the name space.

The python script reports probability of hostname collision with a given deployment size, then prints some examples.

The shell scripts will generate a host from a given seed (like a mac address).  
The script will hash the seed (md5), which allows any unique data source to be used and still effectively span a huge namespace.

`change_hostname.sh $(./name_gen.sh $(cat /sys/class/net/eth0/address))`

