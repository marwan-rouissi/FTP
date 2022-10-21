#! /bin/bash

#MAJ système, installation PROFTPD+tout ses paquets & SSH.
sudo apt-get update && sudo apt-get upgrade
sudo apt-get install proftpd-* -y
sudo apt-get ssh
#Création des utilisateurs
mdp1=$(perl -e 'print crypt("kalimac", "password")')
mdp2=$(perl -e 'print crypt("secondbreakfast", "password")')
sudo useradd -m -p $mdp1 Merry
sudo useradd -m -p $mdp2 Pippin
#Config PROFTPD
cd /etc/proftpd
sudo cp proftpd.conf proftpd.conf.save
#Restriction d'accès du REPO root
echo "DefaultRoot ~" | sudo tee -a proftpd.conf
#FTPS on
echo "Include /etc/proftpd/tls.conf" | sudo tee -a proftpd.cong
#Anonymous on
echo "<Anonymous ~ftp>
User ftp
Group ftp
UserAlias anonymous ftp
DirFakeUser on ftp
DirFakeGroup on ftp
RequireValidShell off
MaxClients 10
<Directory *>
 <Limit WRITE>
  DenyAll
 </Limit>
</Directory>
</Anonymous>" | sudo tee -a proftpd.conf
#Lancement du serveur & status
sudo systemctl restart proftpd
sudo systemctl status proftpd
