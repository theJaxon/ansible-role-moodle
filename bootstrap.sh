#!/bin/bash
# Setup ansible on Ubuntu 18.04 Bionic
ansible_cfg=/home/vagrant/ansible.cfg 

echo "[TASK 1] Install ansible"
apt-add-repository ppa:ansible/ansible && apt update
apt install -y ansible vim bash-completion python3-pip
echo "[TASK 2] Add ansible.cfg file"
if [ ! -f "$ansible_cfg" ]; then 
touch "$ansible_cfg"
cat >> "$ansible_cfg" << EOF 
[defaults]
remote_user = vagrant 
ask_pass = False 

[privilege_escalation]
become = True 
become_user = root 
become_method = sudo 
become_ask_pass = False
EOF
else 
echo "ansible.cfg already exists on $ansible_cfg"
fi