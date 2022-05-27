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

