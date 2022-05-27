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
else
    echo "[NOTICE] openssh-server is already running."
fi

# Install Docker
########################################
if [ -z "$(pidof dockerd)" ]
then
    sudo apt install -y docker.io
else
    echo "[NOTICE] docker daemon is already running."
fi

if [ -z "$(groups | grep docker)" ]
then
    sudo groupadd docker
    sudo usermod -aG docker "$USER"
else
    echo "[NOTICE] \`docker\` group is already created."
fi 

# Install docker-compose
########################################
if [ -z "$(which docker-compose)" ]
then
    sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
else
    echo "[NOTICE] \`docker-compose\` is already installed."
fi

# Create git user for Git Repository
########################################
if [ -z "$(egrep -e git /etc/passwd)" ]
then
    sudo useradd --system --user-group --shell /bin/bash --create-home --home-dir /home/git git
else
    echo "[NOTICE] \`git\` account is alreay exists."
fi

if [ -z "$(egrep -e jenkin /etc/passwd)" ]
then
    sudo useradd --system --user-group --shell /bin/bash --create-home --home-dir /home/jenkins jenkins
else
    echo "[NOTICE] \`jenkins\` account is alreay exists."
fi

# Install Nix for multi-user
########################################
if [ -z "$(which nix)" ]
then
    sh <(curl -L https://nixos.org/nix/install) --daemon
    #echo "source \"$HOME/.nix-profile/etc/profile.d/nix.sh\"" >> $HOME/.bashrc
else
    echo "[NOTICE] Nix is already installed."
fi

# Install Nix Flakes
########################################
if [ ! -f "$HOME/.config/nix/nix.conf" ]
then
    mkdir -p "$HOME/.config/nix" && touch "$HOME/.config/nix/nix.conf"
    echo "experimental-features = nix-command flakes" | tee --append "$HOME/.config/nix/nix.conf" > /dev/null
else
    echo "[NOTICE] Nix Flakes are already seted up."
fi


# add $HOME/.emacs.d/bin path to .profile
########################################
if [ -z "$(egrep -e ".emacs.d/bin" $HOME/.profile)" ]
then
    tee --append "$HOME/.profile" > /dev/null <<EOF

# set PATH so it includes user's private bin if it exists
if [ -d "\$HOME/.emacs.d/bin" ] ; then
    PATH="\$HOME/.emacs.d/bin:\$PATH"
fi
EOF
else
    echo "[NOTICE] \`.emacs.d/bin\` path is already added to \`.profile\` file."
fi

# Install Doom Emacs
########################################
if [ -d "$HOME/.emacs.d/bin" ]
then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    "$HOME/.emacs.d/bin/doom" install
    "$HOME/.emacs.d/bin/doom" sync
else
    echo "[NOTICE] \`.emacs.d/bin\` path is not exists yet."
fi

