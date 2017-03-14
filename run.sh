#/bin/bash

echo "Do you want to run this playbook on a specific group of hosts? (y/n)"       
read specific_hosts
if [ "$specific_hosts" = "y" ]
then
  echo "Which hosts group do you want to run this on?"
  read host_group
  ansible-playbook justin-ansible-pi.yml -i hosts -l $host_group --ask-pass
else
  ansible-playbook justin-ansible-pi.yml -i hosts --ask-pass
fi
