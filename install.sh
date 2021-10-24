#!/bin/bash
echo -e "Installer script by neeythann\n"

# Check if script is run by root
if [ $EUID == 0 ]; then
	echo "Please run this script as a normal user"
    exit 1
fi

clear

for i in {10..1}
do
	echo "This script will install most tools and configurations that I use"
	echo "Press control + C to cancel this script"
	echo
	echo "installing in $i"
	sleep 1;
	clear
done

# install the following as root user:
echo "Please enter your password";
sudo -- sh -c '

echo "installing dependencies";

apt-get -y update;

apt-get install -y curl;
apt-get install -y git;
apt-get install -y tmux;
apt-get install -y python3;
apt-get install -y python2;
apt-get install -y docker;
apt-get install -y docker-compose;
apt-get install -y speedtest-cli;
apt-get install -y net-tools;
apt-get install -y openvpn;
apt-get install -y zsh;
apt-get install -y gdb;

echo -e "installing pip2 and pip3";

curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2
curl https://bootstrap.pypa.io/pip/get-pip.py | python3
'

git clone https://github.com/longld/peda.git ~/peda
echo "source ~/peda/peda.py" >> ~/.gdbinit

pip3 install virtualenv
mkdir ~/virtenv
cd ~/virtenv
virtualenv --python=/usr/bin/python2.7 virt2.7

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# TODO: There seems to be a problem with transfering the config files if the current terminal is active. Will fix this soon.
# PS: might as well install these manually? 
#
# echo "installing configurations"
# echo "old configurations are located at ~/old_config"
#
# eval "$(thefuck --alias)"
#
# #move conf files to directory
# mkdir ~/.old_config
# mv .tmux.conf ~/.old_config/.tmux.conf
# mv .bashrc ~/.old_config/.bashrc
# mv .zshrc ~/.old_config/.zshrc
# 
# #copy config files to home dir
# cp .conf/tmux.conf ~/.tmux.conf
# cp .conf/zshrc ~/.zshrc
# cp .conf/bashrc ~/.bashrc
# 
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
# echo "Done! Don't forget to update your Tmux panel and your p10k zsh shell"
# exit 0
# 

echo "Done!"
