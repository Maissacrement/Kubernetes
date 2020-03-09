#!make

help:
		echo "Usage: make [TARGET]" &&\
		echo "Targets:" &&\
		echo -e "\tup    start vagrant" &&\
		echo -e "\trm    rm vagrant vm" &&\
		echo -e "\tssh   ssh connect to vagrant" &&\
		echo -e "\tping  ping ssh" &&\
		exit 0

up:
	vagrant up

provision:
	vagrant provision

reload:
	vagrant reload

rm:
	vagrant destroy

ssh:
	vagrant ssh

ping:
	ansible all -i inventory/host -m ping
