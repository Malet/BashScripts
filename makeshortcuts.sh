## dark0dave directory setup
#!/bin/bash
clear
bash

## Add Freenas
sudo apt-get install cifs-utils

echo "Creating Freenas + Archive Dir"
mkdir ~/Freenas ~/Archive

echo "Editing /etc/hosts"
echo "Please enter the internal ip address of Server, followed by [Enter]"
read ip
sudo echo $ip "	Freenas" >> /etc/hosts

# Edit fstab so cifs folders can be accessed at startup with rw perms
echo "Editing /etc/fstab"
CURRENTUSER=$(id -u -n)
sudo echo "//Freenas/Primary_Data	~/Freenas cifs	exec,credentials=~/.freenascred,uid=$CURRENTUSER,file_mode=0777,dir_mode=0777,noperm	0	0" >> /etc/fstab
sudo echo "//Freenas/Archive	~/Archive	cifs	exec,credentials=~/.freenascred,uid=$CURRENTUSER,file_mode=0777,dir_mode=0777,noperm	0	0" >> /etc/fstab

# Setup password file
echo "Seting up password file, please enter username, followed by [Enter]"
read username
echo "username="$username >> ~/.freenascred
echo "Please enter password, followed by [Enter]"
read password
echo "password="$password >> ~/.freenascred

## Remove default folders and link to server
rm -r -f ~/Downloads ~/Documents ~/Pictures ~/Music
ln -s ~/Freenas/Downloads ~/Downloads
ln -s ~/Freenas/Documents ~/Documents
ln -s ~/Freenas/Pictures ~/Pictures
ln -s ~/Freenas/Music ~/Music

## remove other trash (these are for other flavours)
rm -r -f ~/Podcasts ~/Videos ~/Templates ~/Public

# Coding Tools 
sudo apt-get install zsh tmux vim git

# Ganglio Dotfiles <-- Thanks these are great!
echo "Thanks to ganglio for his dotfiles"
curl -l https://raw.githubusercontent.com/ganglio/dotfiles/master/install.sh | sh
 echo "Command Completed"
