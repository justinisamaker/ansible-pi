#/bin/bash

echo "Do you want to run this playbook on a specific group of hosts? (y/n)"
read specific_hosts
if [ "$specific_hosts" = "y" ]
then
  echo "Which hosts group do you want to run this on?"
  read host_group
  ansible-playbook -s -i hosts ansible-pi.yml -l $host_group
else
  ansible-playbook -s -i hosts ansible-pi.yml
fi
