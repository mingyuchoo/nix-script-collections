#! /bin/bash 

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
if [ -z "$(which emacs)" ]
then
    echo "[NOTICE] emacs is not exists yet."
else
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    "$HOME/.emacs.d/bin/doom" install
    "$HOME/.emacs.d/bin/doom" sync
fi

# Install vundler 
########################################
if [ -d "$HOME/.vim/bundle" ]
then
    echo "[NOTICE] vundler is already exists."
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    cp .vimrc "$HOME"
    echo "[DONE] vundler is installed successfully."
fi

# Set up Git config file to $HOME
########################################
if [ -z "$HOME/.gitconfig" ]
then
    cp .gitconfig "$HOME"

    read -p "Enter your git email-address: " email
    read -p "Enter your name: " name
    read -p "Do you want to confirm? (y/n): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1

    sed -i "s/my-email@address/$email/g" "$HOME/.gitconfig"
    sed -i "s/my-name/$name/g" "$HOME/.gitconfig"

    echo "[DONE] \`.gitconfig\` file is copied successfully."
else
    echo "[NOTICE] \`.gitconfig\` file is already exists."
fi

# Copy Haskell config files to $HOME
########################################
if [ -z "$HOME/.stylish-haskell.yaml" ]
then
    cp .stylish-haskell.yaml "$HOME"
    echo "[DONE] \`.stylish-haskell.yaml\` file is copied successfully."
else
    echo "[NOTICE] \`.stylish-haskell.yaml\` file is already exists."
fi

if [ -z "$HOME/.ghc" ]
then
    cp -rf .ghc "$HOME"
    echo "[DONE] \`.ghc\` directory is copied successfully."
else
    echo "[NOTICE] \`.ghc\` directory is already exists."
fi

# Copy Tmux config file to $HOME
########################################
if [ -z "$HOME/.tmux.conf" ]
then
    cp .tmux.conf "$HOME"
    echo "[DONE] \`.tmux.conf\` file is copied successfully."
else
    echo "[NOTICE] \`.tmux.conf\` file is already exists."
fi
