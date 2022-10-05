
sudo apt-get update
sudo apt-add-repository -y ppa:ansible/ansible

sudo apt-get update

sudo apt-get install -y ansible

sudo apt install python-pip -y

sudo pip install boto boto3

sudo apt-get install python-boto -y

pip list boto | grep boto

ansible --version


ANSIBLE PLAYBOOK INSTALL APACHE
ssh-keygen

sudo cat ~/.ssh/id_rsa.pub

Target node commands

sudo vi /home/ubuntu/.ssh/authorized_keys
type shift A and then enter. now

Management node commands
Type ssh (xx.xx.xx.xx private_ip_of_target_node)

sudo vi /etc/ansible/hosts

[Apache_Group] 
xx.xx.xx.xx ansible_ssh_user=ubuntu ansible_ssh_private_key_file=~/.ssh/id_rsa ansible_python_interpreter=/usr/bin/python3
(xx.xx.xx means public ip of target node)


---
- hosts: Apache_Group
  become: true
  tasks:
    - name: Install apache
      apt: name=apache2 state=present update_cache=yes
    - name: ensure apache started
      service: name=apache2 state=started enabled=yes

sudo ansible-playbook installApache.xml
