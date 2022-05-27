#! /bin/bash 

# Update Ubuntu
########################################
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

# Install OpenSSH Server
########################################
if [ -z "$(pidof sshd)" ]
then
    sudo apt install -y openssh-server
    sudo systemctl enable ssh
    sudo systemctl start ssh
    sudo ufw allow ssh
    echo "[DONE] opensshe-server is installed successfully."
else
    echo "[NOTICE] openssh-server is already running."
fi

# Install Docker
########################################
if [ -z "$(pidof dockerd)" ]
then
    sudo apt install -y docker.io
    echo "[DONE] docker is installed successfully."
else
    echo "[NOTICE] docker daemon is already running."
fi

if [ -z "$(groups | grep docker)" ]
then
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
    echo "[DONE] docker group is created successfully."
else
    echo "[NOTICE] \`docker\` group is already created."
fi 

# Install docker-compose
########################################
if [ -z "$(which docker-compose)" ]
then
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "[DONE] docker-compose is installed successfully."
else
    echo "[NOTICE] \`docker-compose\` is already installed."
fi

# Create git user for Git Repository
########################################
if [ -z "$(egrep -e git /etc/passwd)" ]
then
    sudo useradd --system --user-group --shell /bin/bash --create-home --home-dir /home/git git
    echo "[DONE] \`git\` account is created successfully."
else
    echo "[NOTICE] \`git\` account is alreay exists."
fi

if [ -z "$(egrep -e jenkin /etc/passwd)" ]
then
    sudo useradd --system --user-group --shell /bin/bash --create-home --home-dir /home/jenkins jenkins
    echo "[DONE] \`jenkins\` account is created successfully."
else
    echo "[NOTICE] \`jenkins\` account is alreay exists."
fi

# Install Nix for multi-user
########################################
if [ -z "$(which nix)" ]
then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    #echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> $HOME/.bashrc
    echo "[DONE] Nix is installed successfully."
else
    echo "[NOTICE] Nix is already installed."
fi

# Install Nix Flakes
########################################
if [ -f "$HOME/.config/nix/nix.conf" ]
then
    echo "[NOTICE] Nix Flakes are already seted up."
else
    mkdir -p "$HOME/.config/nix" && touch "$HOME/.config/nix/nix.conf"
    echo "experimental-features = nix-command flakes" | tee --append "$HOME/.config/nix/nix.conf" > /dev/null
    echo "[DONE] Nix Flakes configuration is created successfully."
fi


# Add Nix Flakes start up script to .profile
########################################
if [ -z "$(egrep -e develop $HOME/.profile)" ]
then
    tee --append "$HOME/.profile" > /dev/null <<EOF

# Start up Nix Flakes
nix develp $PWD
EOF
    echo "[DONE] Nix Flakes is added to .profile successfully."
else
    echo "[NOTICE] Nix Flakes is already added to .profile"
fi
