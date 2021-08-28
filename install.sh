#!/bin/bash
echo -e "Intaller script by neeythann\n"

# Check if script is run by root
if [ $EUID -ne 0 ]; then
    echo "Usage: sudo $0"
    exit 1
fi

clear

for i in {10..1}
do
	echo "This script will instal most tools and configurations that I use"
	echo "Press control + C to cancel this script"
	echo
	echo "installing in $i"
	sleep 1;
	clear
done

apt-get -y update

# install the following:

echo "installing dependencies"
apt-get install -y curl
apt-get install -y git
apt-get install -y tmux
apt-get install -y python3
apt-get install -y python2
apt-get install -y docker
apt-get install -y docker-compose
apt-get install -y speedtest-cli
apt-get install -y net-tools
apt-get install -y openvpn
apt-get install -y zsh

echo -e "installing pip2 and pip3"

curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2
curl https://bootstrap.pypa.io/pip/get-pip.py | python3

pip3 install thefuck
pip3 install virtualenv
mkdir ~/virtenv
#cd ~/virtenv
#virtualenv --python=/usr/bin/python2.7 virt2.7
#source virt2.7/bin/activate
#virt2.7/pip install somethinghere

echo "installing Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "installing powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

echo "installing configurations"
echo "old configurations are located at ~/old_config"

#move conf files to directory
mkdir ~/.old_config
mv .tmux.conf ~/.old_config/.tmux.conf
mv .bashrc ~/.old_config/.bashrc
mv .zshrc ~/.old_config/.zshrc

#copy config files tgo hoem dir
cp .conf/tmux.conf ~/.tmux.conf
cp .conf/zshrc ~/.zshrc
cp .conf/bashrc ~/.bashrc

echo "Done! Don't forget to update your Tmux panel and your p10k zsh shell"
exit 0
