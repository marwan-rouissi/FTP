#! /bin/bash


file=ftpusers.csv
while IFS=',' read user pw role
do
pass=$(perl -e 'print crypt($ARGV[0], "password")' $pw)
sudo useradd -m -p "$pass" "$user"
if [ $role = Admin ]
then
sudo adduser "$user" sudo
echo "$user is an Admin"
else echo "$user is a user"
fi
done < <(cat $file| awk '(NR>1)')
