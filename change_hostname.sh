#!/bin/bash

new_host_name=$1
old_host_name=$(hostname)

if [ $new_host_name == $old_host_name ]
then
  echo "hostname looks fine, finished"
  exit 0
else
  echo "old hostname is $old_host_name, changing to $new_host_name"

  # change the system hostname
  hostnamectl set-hostname --static $new_host_name

  # update /etc/hosts
  # this applies to debian systems and doesn't get touched by hostnamectl
  sed -i -E 's/^127.0.1.1.*/127.0.1.1   '"$new_host_name"'/' /etc/hosts
  # mop up the alias on ::1
  sed -i -E 's/'"$old_host_name"'/'"$new_host_name"'/g' /etc/hosts

  # announce on the local network as $new_host_name.local
  systemctl restart avahi-daemon

  # the machine would benefit from a reboot at this point

fi

exit 0
