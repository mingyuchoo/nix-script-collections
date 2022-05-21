#! /bin/bash 

# Update Ubuntu
########################################
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Install OpenSSH Server
########################################
sudo apt install -y openssh-server
sudo systemctl enable ssh
sudo systemctl start ssh
sudo ufw allow ssh

# Install Docker
########################################
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker $USER

# Install docker-compose
########################################
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create git user for Git Repository
########################################
sudo useradd -mrUd /home/git git

# Install Nix for multi-user
########################################
sh <(curl -L https://nixos.org/nix/install) --daemon
echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> .bashrc

# Install Doom Emacs
########################################
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
$HOME/.emacs.d/bin/doom install
$HOME/.emacs.d/bin/doom sync
