#! /bin/bash

#Supprimer PROFTPD proprement & les utilisateurs crées
sudo apt purge proftpd-* -y
sudo apt autoremove -y
sudo deluser --remove-home Merry
sudo deluser --remove-home Pippin

# Supprimer les utilisateurs ajoutés du Job_9

#cd /home/rouissi/Job_9
#file=ftpusers.csv
#while IFS=',' read user pw role
#do
#sudo deluser --remove-home $user

#done < <(cat $file|awk '(NR>1)')
